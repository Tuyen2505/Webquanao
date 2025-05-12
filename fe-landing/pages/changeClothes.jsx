import { useState, useEffect } from "react";

export default function ImageUploader() {
  const [files, setFiles] = useState({ image1: null, image2: null });
  const [checkboxes, setCheckboxes] = useState({ upperbody: false, lowerbody: false });
  const [resultData, setResultData] = useState(null);
  const [imageResult, setImageResult] = useState(null);
  const [socket, setSocket] = useState(null);
  const [receivedImage, setReceivedImage] = useState(false);

  const [captionImage, setCaptionImage] = useState(null);

  const handleCaptionImage = (e) => {
    setCaptionImage(e.target.files[0]);
  };

  useEffect(() => {
    const ws = new WebSocket("ws://localhost:8765");
    setSocket(ws);

    ws.onmessage = (event) => {
      console.log("📩 Phản hồi từ server:", event.data);
      const response = JSON.parse(event.data);
      
      if (response.status === "success") {
        setResultData(response);
      } 
      
      if (response.image) {
        setImageResult(`data:image/png;base64,${response.image}`);
        setReceivedImage(true);
      }
    };

    ws.onerror = (error) => console.error("⚠ Lỗi WebSocket:", error);

    return () => {
      if (receivedImage) {
        console.log("🔌 Đóng WebSocket sau khi nhận ảnh xong");
        ws.close();
      }
    };
  }, [receivedImage]);

  const handleImageChange = (e) => {
    const { name, files } = e.target;
    if (files.length > 0) {
      setFiles((prev) => ({ ...prev, [name]: files[0] }));
    }
  };

  const handleCheckboxChange = (e) => {
    const { name, checked } = e.target;
    setCheckboxes((prev) => ({ ...prev, [name]: checked }));
  };

  const handleSubmit = async () => {
    if (!socket || socket.readyState !== WebSocket.OPEN) {
      alert("WebSocket chưa được kết nối.");
      return;
    }

    const jsonPath = checkboxes.upperbody ? "/json/upperbody.json" : checkboxes.lowerbody ? "/json/lowerbody.json" : null;
    if (!jsonPath) {
      alert("Vui lòng chọn một trong hai tùy chọn.");
      return;
    }

    if (!files.image1 || !files.image2) {
      alert("Vui lòng tải lên cả hai ảnh.");
      return;
    }

    const jsonResponse = await fetch(jsonPath);
    const jsonData = await jsonResponse.json();

    const image1Base64 = await readFileAsBase64(files.image1);
    const image2Base64 = await readFileAsBase64(files.image2);

    const payload = JSON.stringify({
      jsonData,
      image1: image1Base64,
      image2: image2Base64,
    });

    setReceivedImage(false);
    socket.send(payload);
  };

  const readFileAsBase64 = (file) => {
    return new Promise((resolve) => {
      const reader = new FileReader();
      reader.onload = () => resolve(reader.result);
      reader.readAsDataURL(file);
    });
  };

  return (
    <div style={{
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      padding: '2rem',
      maxWidth: '800px',
      margin: '0 auto',
      backgroundColor: '#f9fafb',
      borderRadius: '12px',
      boxShadow: '0 4px 12px rgba(0, 0, 0, 0.1)',
      gap: '1.5rem'
    }}>
      <div style={{ display: 'flex', gap: '2rem', flexWrap: 'wrap', justifyContent: 'center' }}>
        {/* Clothes Upload and Preview */}
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '0.5rem' }}>
          <p style={{ fontSize: '1.1rem', fontWeight: '600', color: '#1f2937' }}>Clothes</p>
          <div style={{
            width: '300px',
            height: '300px',
            border: '2px dashed #d1d5db',
            borderRadius: '8px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            backgroundColor: '#ffffff',
            overflow: 'hidden'
          }}>
            {files.image1 ? (
              <img
                src={URL.createObjectURL(files.image1)}
                alt="Clothes preview"
                style={{ width: '100%', height: '100%', objectFit: 'cover' }}
              />
            ) : (
              <span style={{ color: '#6b7280', fontSize: '1rem' }}>No image</span>
            )}
          </div>
          <input
            type="file"
            name="image1"
            onChange={handleImageChange}
            style={{
              padding: '0.5rem',
              border: '2px solid #d1d5db',
              borderRadius: '8px',
              backgroundColor: '#ffffff',
              width: '100%',
              marginTop: '0.5rem'
            }}
          />
        </div>

        {/* Person Upload and Preview */}
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '0.5rem' }}>
          <p style={{ fontSize: '1.1rem', fontWeight: '600', color: '#1f2937' }}>Person</p>
          <div style={{
            width: '300px',
            height: '300px',
            border: '2px dashed #d1d5db',
            borderRadius: '8px',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            backgroundColor: '#ffffff',
            overflow: 'hidden'
          }}>
            {files.image2 ? (
              <img
                src={URL.createObjectURL(files.image2)}
                alt="Person preview"
                style={{ width: '100%', height: '100%', objectFit: 'cover' }}
              />
            ) : (
              <span style={{ color: '#6b7280', fontSize: '1rem' }}>No image</span>
            )}
          </div>
          <input
            type="file"
            name="image2"
            onChange={handleImageChange}
            style={{
              padding: '0.5rem',
              border: '2px solid #d1d5db',
              borderRadius: '8px',
              backgroundColor: '#ffffff',
              width: '100%',
              marginTop: '0.5rem'
            }}
          />
        </div>
      </div>

      {/* Checkbox Group */}
      <div style={{ display: 'flex', gap: '2rem', justifyContent: 'center' }}>
        <div>
          <label style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#374151', cursor: 'pointer' }}>
            <input
              type="checkbox"
              name="upperbody"
              checked={checkboxes.upperbody}
              onChange={handleCheckboxChange}
              style={{ width: '1.25rem', height: '1.25rem', accentColor: '#3b82f6' }}
            />
            Upper Body
          </label>
        </div>
        <div>
          <label style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', color: '#374151', cursor: 'pointer' }}>
            <input
              type="checkbox"
              name="lowerbody"
              checked={checkboxes.lowerbody}
              onChange={handleCheckboxChange}
              style={{ width: '1.25rem', height: '1.25rem', accentColor: '#3b82f6' }}
            />
            Lower Body
          </label>
        </div>
      </div>

      {/* Submit Button */}
      <button
        onClick={handleSubmit}
        style={{
          backgroundColor: '#3b82f6',
          color: '#ffffff',
          padding: '0.5rem 1rem',
          borderRadius: '8px',
          border: 'none',
          cursor: 'pointer',
          fontSize: '1rem',
          fontWeight: '500',
          transition: 'background-color 0.3s ease'
        }}
        onMouseOver={(e) => (e.target.style.backgroundColor = '#2563eb')}
        onMouseOut={(e) => (e.target.style.backgroundColor = '#3b82f6')}
      >
        Send
      </button>

      {/* Server Response */}
      {resultData && (
        <div style={{
          marginTop: '1rem',
          padding: '1rem',
          border: '1px solid #d1d5db',
          borderRadius: '8px',
          backgroundColor: '#ffffff',
          width: '100%'
        }}>
          <h3 style={{ fontSize: '1.25rem', fontWeight: '700', color: '#1f2937', marginBottom: '0.5rem' }}>
            Phản hồi từ Server:
          </h3>
          <pre style={{ fontSize: '0.875rem', color: '#374151', whiteSpace: 'pre-wrap' }}>
            {JSON.stringify(resultData, null, 2)}
          </pre>
        </div>
      )}

      {/* Result Image Preview */}
      <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: '0.5rem' }}>
        <p style={{ fontSize: '1.1rem', fontWeight: '600', color: '#1f2937' }}>Result</p>
        <div style={{
          width: '300px',
          height: '300px',
          border: '2px dashed #d1d5db',
          borderRadius: '8px',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'center',
          backgroundColor: '#ffffff',
          overflow: 'hidden'
        }}>
          {imageResult ? (
            <img
              src={imageResult}
              alt="Result from server"
              style={{ width: '100%', height: '100%', objectFit: 'cover' }}
            />
          ) : (
            <span style={{ color: '#6b7280', fontSize: '1rem' }}>No result</span>
          )}
        </div>
      </div>
    </div>
  );
}