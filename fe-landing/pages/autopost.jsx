import { useState } from "react";

function UploadImages() {
  const [captionImage, setCaptionImage] = useState(null);
  const [detailImages, setDetailImages] = useState([]);
  const [productName, setProductName] = useState("");
  const [productLink, setProductLink] = useState("");

  const [status, setStatus] = useState(null);

  const toBase64 = (file) =>
    new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = () => resolve(reader.result.split(",")[1]);
      reader.onerror = (error) => reject(error);
    });

  const handleCaptionImage = (e) => {
    setCaptionImage(e.target.files[0]);
  };

  const handleDetailImages = (e) => {
    setDetailImages([...e.target.files]);
  };

  const removeImage = (index) => {
    setDetailImages((prevImages) => prevImages.filter((_, i) => i !== index));
  };

  const sendToApi = async () => {
    if (!captionImage || detailImages.length === 0 || !productName || !productLink) {
      alert("Vui lòng nhập đầy đủ thông tin và chọn ảnh!");
      return;
    }
  
    setStatus("Đang xử lý dữ liệu...");
  
    try {
      const captionBase64 = await toBase64(captionImage);
      const detailBase64Array = await Promise.all(detailImages.map((file) => toBase64(file)));
  
      const jsonData = {
        product_name: productName,
        product_link: productLink,
        image_caption: captionBase64,
        image_detail: detailBase64Array,
      };
  
      const response = await fetch("http://localhost:3003/upload", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(jsonData),
      });
  
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
  
      const result = await response.json();
      setStatus(result.message || "Gửi dữ liệu thành công!");
    } catch (error) {
      setStatus("Lỗi khi gửi dữ liệu: " + error.message);
    }
  };

  return (
    <div className="autopost">
        <h2 className="title">Đăng bài quảng cáo Facebook</h2>
        <div className="container">

            <label className="label">Tên sản phẩm:</label> 
            <input type="text"
                placeholder="Nhập tên sản phẩm"
                className="input"
                value={productName}
                onChange={(e) => setProductName(e.target.value)}
            />

            <label className="label">Link mua sản phẩm:</label> 
            <input type="text"
                placeholder="Nhập link mua hàng"
                className="input"
                value={productLink}
                onChange={(e) => setProductLink(e.target.value)}
            />

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



            <label className="label">Ảnh mô đăng bài quảng cáo:</label>
            <div
                style={{
                    display: "flex",
                    gap: "10px",
                    padding: "10px",
                    backgroundColor: "#f0f0f0",
                    borderRadius: "10px",
                    minHeight: "160px",
                    width: detailImages.length > 0 ? `${detailImages.length * 160 + 20}px` : "160px",
                    alignItems: "center",
                    justifyContent: detailImages.length === 0 ? "center" : "flex-start", // Căn giữa khi chưa có ảnh
                    overflowX: "auto",
                    whiteSpace: "nowrap",
                }}
                >
                {detailImages.length > 0 ? (
                    detailImages.map((image, index) => (
                    <div key={index} style={{ position: "relative", display: "inline-block", width: "150px" }}>
                        <img
                        src={URL.createObjectURL(image)}
                        alt={`Ảnh ${index + 1}`}
                        style={{ width: "150px", height: "150px", objectFit: "cover", borderRadius: "5px" }}
                        />
                        <button
                        onClick={() => removeImage(index)}
                        style={{
                            position: "absolute",
                            top: "-5px",
                            right: "-5px",
                            backgroundColor: "red",
                            color: "#fff",
                            border: "none",
                            borderRadius: "50%",
                            width: "20px",
                            height: "20px",
                            cursor: "pointer",
                        }}
                        >
                        ✕
                        </button>
                    </div>
                    ))
                ) : (
                    <span style={{ color: "#999" }}>Chưa có ảnh</span>
                )}
            </div>
            <label htmlFor="file-upload-1" className="custom-file-upload">
                Upload ảnh
            </label>
            <input id="file-upload-1" type="file" accept="image/*" multiple onChange={handleDetailImages} />
            <br />

            {/* Gửi API */}
            <button className="send" onClick={sendToApi}>
                Gửi đến HTTP
            </button>

            {status && <p>{status}</p>}
        </div>
    </div>
  );
}

export default UploadImages;