<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebChat.aspx.cs" Inherits="tbl.WebChat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/grid.css">
    <title>WebChat</title>

    <style>
    * {
        box-sizing: border-box;
        margin: 0;
    }

    .container {
        display: flex;
        flex-wrap: wrap;
        height: 100vh;
    }

    #memsArea {
        height: 85%;
        width: 25%; 
        border: 4px solid #ccc;
    }

    #messArea {
        height: 85%;
        width: 75%;
        border: 4px solid #ccc;
        border-left: 0px;
        
    }

    #inpArea {
        border: 4px solid #ccc;
        border-top: 0px;
    }

    #btnLogout {
        position: absolute;
        top: 50px;
        right: 10px;
        background-color: black;
        color: white;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        margin-right: 10px;
        transition: 0.3s;
        z-index:999;
    }
    #btnLogout:hover {
        background-color: white;
        color: black;
    }

    /* Responsive CSS */
        @media only screen and (max-width: 768px) {

        #memsArea, #messArea, #inpArea {
        width: 100%;
        height: 50%;
        }
    }

    #total {
        position: absolute;
        bottom: 5px;
        left: 5px;
    }

</style>

</head>
<body>
    
    <button class="" id="btnLogout" onclick="logout()">Quay lại</button>
    <p style="font: Josefin Sans; font-size:20px; margin-bottom:5px; color: red;">Topic: <span id="topicName"></span></p>
    <div class="container">
        <iframe class="l-4" id="memsArea" name="memsArea" src="User.aspx"></iframe>
        <iframe class="l-8" id="messArea" name="messArea" src="MessageList.aspx"></iframe>
        <iframe class="l-12" id="inpArea" name="inpArea" src="PostMsg.html"></iframe>
    </div>

    <div id="total" style="font: Josefin Sans; font-size:20px; color:red;" <%--style="position: fixed; top: 0; right: 0; padding: 10px; background-color: #fff; z-index: 999;"--%>>
        <asp:Label ID="lblMemberCount" runat="server" Text="Total Members:"></asp:Label>
    </div>

    <script>
        function logout() {
            window.location.href = "Topic.aspx";
        }
        window.onload = function () {
            var urlParams = new URLSearchParams(window.location.search);
            var topic = urlParams.get('topic');
            document.getElementById('topicName').textContent = topic;
        };
    </script>

</body>
</html>