<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Topic.aspx.cs" Inherits="tbl.Topic" %>

<!DOCTYPE html>
<html>
<head>
    <title>Topics</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        #header {
            text-align: center;
            margin-bottom: 20px;
        }

        #addTopicForm {
            margin-top: 30px;
            margin-bottom: 20px;
        }

        #addTopicForm label {
            font-weight: bold;
        }

        #addTopicForm input[type="text"] {
            width: 200px;
            padding: 5px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        #addTopicBtn {
            padding: 5px 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 3px;
            cursor: pointer;
        }

        #addTopicBtn:hover {
            background-color: #0056b3;
        }

        #topicList {
            list-style-type: none;
            padding: 0;
            text-align: center; /* Canh giữa nội dung của danh sách */

            display: flex;
            flex-direction: column;

        }

        #topicList li {
            margin-bottom: 10px;
            margin-top: 10px;
            /*display: inline-block; /* Hiển thị các phần tử danh sách cùng một hàng */
        }

        #topicList a {
            text-decoration: none;
            text-align: center; 
            padding: 8px; 
            border-radius: 15px; 
            color: white; 
            background-color: #333;
            transition: 0.3s;
        }

        #topicList a:hover {
            background-color: #eaeaea;
            color: black;
        }


        #lblUsername {
            font-weight: bold;
            position: absolute;
            top: 10px;
            right: 10px;
            color: black;
            padding: 10px 20px;
            cursor: pointer;
            margin-right: 10px;
            transition: 0.3s;
        }

        #lblUsername:hover {
            text-decoration: underline;
        }

        #btnLogout {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: black;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            margin-right: 10px;
            transition: 0.3s;
        }

        #btnLogout:hover {
            background-color: white;
            color: black;
        }

        img {
            margin-top: 10px;
            display: block;
            margin: 0 auto;
        }

        .image-container {
            width: 50%; 
            margin: 0 auto;
        }

        img {
            width: 100%;
        }
    </style>
</head>
<body>
    <h2>Chủ đề chat</h2>

    <div class="image-container">
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Hot_Topic_logo.svg/640px-Hot_Topic_logo.svg.png" alt="HOT TOPIC" >
    </div>

    <div id="header">
        <!-- Hiển thị tên người dùng từ Session -->
        <asp:Label ID="lblUsername" runat="server"></asp:Label>
        <!-- Form để thêm topic mới -->
        <form id="addTopicForm">
            <label for="topicName">Tên chủ đề:</label>
            <input type="text" id="topicName" name="topicName" />
            <input type="button" id="addTopicBtn" value="Thêm" />
        </form>
    </div>

    <ul id="topicList">
        <!-- Danh sách các topic sẽ được hiển thị ở đây -->
    </ul>

    <button class="" id="btnLogout" onclick="logout()">Đăng xuất</button>

    <script>

        // Function để load danh sách topic từ localStorage và hiển thị trên trang
        function loadTopics() {
            var topics = localStorage.getItem('topics');
            if (topics) {
                var topicList = document.getElementById('topicList');
                topicList.innerHTML = ''; // Xóa nội dung cũ của danh sách topic

                // Tách chuỗi topics thành mảng các topic
                var topicArray = topics.split(',');

                topicArray.forEach(function (topic) {
                    var li = document.createElement('li');
                    var link = document.createElement('a');
                    link.textContent = topic;
                    link.href = 'WebChat.aspx?topic=' + encodeURIComponent(topic); // Tạo liên kết sang WebChat.aspx với tham số topic
                    li.appendChild(link);
                    topicList.appendChild(li);
                });
            }
        }

        // Xử lý sự kiện click của nút "Add Topic"
        document.getElementById('addTopicBtn').addEventListener('click', function () {
            // Lấy tên topic từ input
            var topicName = document.getElementById('topicName').value.trim();
            if (topicName !== '') {
                // Lấy danh sách topic từ localStorage hoặc tạo mới nếu chưa có
                var topics = localStorage.getItem('topics') || '';
                // Thêm topic mới vào danh sách
                topics += (topics ? ',' : '') + topicName;
                // Lưu danh sách topic vào localStorage
                localStorage.setItem('topics', topics);
                // Cập nhật danh sách topic trên trang
                loadTopics();
                // Xóa nội dung trong input
                document.getElementById('topicName').value = '';
            } else {
                alert('Please enter a topic name.');
            }
        });

        // Gọi hàm loadTopics khi trang được tải
        window.onload = function() {
            loadTopics(); // Gọi hàm loadTopics
            updateWelcome(); // Gọi hàm updateWelcome
            //clearTopics();
        };

        // Function để cập nhật "Welcome" dựa trên trạng thái đăng nhập
        function updateWelcome() {
            var username = '<%= Session["username"] %>';
            var lblUsername = document.getElementById('lblUsername');
            if (username) {
                lblUsername.textContent = 'Chào mừng, ' + username;
                // Tạo liên kết đến trang info.aspx khi người dùng nhấp vào tên người dùng
                lblUsername.addEventListener('click', function () {
                    window.location.href = 'info.aspx';
                });
            } else {
                lblUsername.textContent = 'Chào mừng';
            }
        }

        function clearTopics() {
            localStorage.removeItem('topics');
            // Cập nhật giao diện để không hiển thị danh sách topic nữa
            var topicList = document.getElementById('topicList');
            topicList.innerHTML = ''; // Xóa toàn bộ nội dung của danh sách topic trên giao diện
        }


        function logout() {
            window.location.href = "Dangnhap.aspx";
        }

    </script>
</body>
</html>>

