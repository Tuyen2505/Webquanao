import { useState, useRef, useEffect } from "react";
import Tippy from '@tippyjs/react/headless'; // Headless để dùng render prop
import 'tippy.js/dist/tippy.css';

const Chatbot = () => {
  const [messages, setMessages] = useState(["Xin chào! Tôi có thể giúp gì cho bạn?"]);
  const [input, setInput] = useState("");
  const tippyInstance = useRef(null);
  const messagesEndRef = useRef(null);
  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const sendMessage = async () => {
    const trimmedInput = input.trim();
    if (trimmedInput !== "") {
      // Hiển thị tin nhắn người dùng
      setMessages((prev) => [...prev, trimmedInput]);
      setInput("");
  
      try {
        const response = await fetch("http://127.0.0.1:5001/generative_ai", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ question: trimmedInput }),
        });
  
        const data = await response.json();
  
        if (data.answer) {
          setMessages((prev) => [...prev, data.answer]);
        } else {
          setMessages((prev) => [...prev, "❗ Lỗi: Không nhận được phản hồi hợp lệ."]);
        }
      } catch (error) {
        console.error("Lỗi khi gửi yêu cầu:", error);
        setMessages((prev) => [...prev, "❗ Lỗi khi gửi yêu cầu đến server."]);
      }
    }
  };
  

  const renderChatbot = (attrs) => (
    <div className="tippyBox" tabIndex="-1" {...attrs}>
      <div className="windowChatbot">
        <div className="sideBarChatbot">
          <span>Chatbot</span>
          <button
            onClick={() => tippyInstance.current?.hide()}
            className="xButton"
          >
            ✖
          </button>
        </div>


        <div
          className="chatSpace flex-1 p-3 overflow-y-auto space-y-2"
          style={{ overflowY: 'auto' }}
        >
          {messages.map((msg, index) => (
            <div
              key={index}
              className={`p-2 rounded max-w-[70%] ${
                index % 2 === 0 ? 'bg-white self-start text-left' : 'bg-blue-100 self-end text-right'
              }`}
            >
              {msg}
            </div>
          ))}
          <div ref={messagesEndRef} />
        </div>


        <div className="inputChatbot">
          <input
            type="text"
            className="input"
            placeholder="Nhập tin nhắn..."
            value={input}
            onChange={(e) => setInput(e.target.value)}
            onKeyDown={(e) => e.key === "Enter" && sendMessage()}
          />
          <button
            onClick={sendMessage}
            className="send"
          >
            Gửi
          </button>
        </div>
      </div>
    </div>
  );

  return (
    <Tippy
      render={renderChatbot}
      interactive={true}
      trigger="click"
      placement="top-start"
      onCreate={(instance) => {
        tippyInstance.current = instance;
      }}
    >
      <div className="chatbot">
        <img className="imgChatbot" src="/img/chatbot/chatbot.png" alt="" />
      </div>
    </Tippy>
  );
};

export default Chatbot;
