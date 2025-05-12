import { useState, useEffect } from "react";

export default function ImageUploader() {
  const [files, setFiles] = useState({ image1: null, image2: null });
  const [checkboxes, setCheckboxes] = useState({ upperbody: false, lowerbody: false });
  const [resultData, setResultData] = useState(null);
  const [imageResult, setImageResult] = useState(null);
  const [socket, setSocket] = useState(null);
  const [receivedImage, setReceivedImage] = useState(false); // Theo dõi ảnh đã nhận

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
        setReceivedImage(true); // Đánh dấu đã nhận ảnh
      }
    };

    ws.onerror = (error) => console.error("⚠ Lỗi WebSocket:", error);

    return () => {
      if (receivedImage) {
        console.log("🔌 Đóng WebSocket sau khi nhận ảnh xong");
        ws.close(); // Chỉ đóng khi đã nhận ảnh
      }
    };
  }, [receivedImage]); // Theo dõi khi nhận ảnh thì mới đóng WebSocket

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

    setReceivedImage(false); // Reset trạng thái nhận ảnh
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
    <div className="flex flex-col items-center p-4 space-y-4">
      <div>
        <p>Clothes</p>
        <input type="file" name="image1" onChange={handleImageChange} className="border p-2" />
      </div>
      <div>
        <p>Person</p>
        <input type="file" name="image2" onChange={handleImageChange} className="border p-2" />
      </div>




      <label className="label">Ảnh để AI viết quảng cáo:</label>
      <div
          style={{
          width: "200px",
          height: "200px",
          backgroundColor: "#f0f0f0",
          display: "flex",
          alignItems: "center",
          justifyContent: "center",
          borderRadius: "10px",
          overflow: "hidden",
          marginBottom: "10px",
          }}
      >
          {captionImage ? (
          <img src={URL.createObjectURL(captionImage)} alt="Ảnh chính" style={{ width: "100%", height: "100%", objectFit: "cover" }} />
          ) : (
          <span style={{ color: "#999" }}>Chưa có ảnh</span>
          )}
      </div>
      <label htmlFor="file-upload" className="custom-file-upload">
          Upload ảnh
      </label>
      <input id="file-upload" type="file" accept="image/*" onChange={handleCaptionImage} />
      <br />




      <div className="flex space-x-4">
        <div>
          <label>
            <input
              type="checkbox"
              name="upperbody"
              checked={checkboxes.upperbody}
              onChange={handleCheckboxChange}
            />{" "}
            Upper Body
          </label>
        </div>
        <div>
          <label>
            <input
              type="checkbox"
              name="lowerbody"
              checked={checkboxes.lowerbody}
              onChange={handleCheckboxChange}
            />{" "}
            Lower Body
          </label>
        </div>
      </div>

      <button onClick={handleSubmit} className="bg-blue-500 text-white p-2 rounded">
        Send
      </button>

      {/* Hiển thị phản hồi từ server */}
      {resultData && (
        <div className="mt-4 p-4 border rounded">
          <h3 className="text-lg font-bold">Phản hồi từ Server:</h3>
          <pre className="text-sm">{JSON.stringify(resultData, null, 2)}</pre>
        </div>
      )}

      {/* Hiển thị ảnh nhận từ WebSocket */}
      {imageResult && (
        <div className="mt-4 p-4 border rounded">
          <h3 className="text-lg font-bold">Ảnh nhận từ Server:</h3>
          <img src={imageResult} alt="Kết quả từ server" className="max-w-full border" />
        </div>
      )}
    </div>
  );
}
