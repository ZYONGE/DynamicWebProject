<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript">
function checkPasswordPattern(str) {
    var pattern1 = /[0-9]/;           // 숫자
    var pattern2 = /[a-zA-Z]/;        // 문자
    var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
    if (!pattern1.test(str) || !pattern2.test(str) || !pattern3.test(str) || str.length < 8) {
        alert("비밀번호는 8자리 이상, 문자·숫자·특수문자를 모두 포함해야 합니다.");
        return false;
    } else {
        return true;
    }
}

function checkForm(frm) {
    var pw = frm.password.value.trim();
    var pw2 = frm.password2.value.trim();

    if (!checkPasswordPattern(pw)) {
        frm.password.focus();
        return false;
    }

    if (pw != pw2) {
        alert("비밀번호가 일치하지 않습니다.");
        frm.password2.focus();
        return false;
    }

    alert("회원가입이 완료되었습니다!");
    frm.submit();
}
</script>
</head>
<body>
<h2>회원가입</h2>
<form name="joinForm" method="post" action="join_ok.jsp">
    <table border="1" cellpadding="5">
        <tr>
            <td>아이디</td>
            <td><input type="text" name="userid" required></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" required></td>
        </tr>
        <tr>
            <td>비밀번호 확인</td>
            <td><input type="password" name="password2" required></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="회원가입" onclick="checkForm(this.form)">
                <input type="reset" value="다시쓰기">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
