/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

document.getElementById('googleLoginBtn').addEventListener('click', function (event) {
    if (grecaptcha.getResponse() === '') {
        event.preventDefault();
        alert('Please complete the reCAPTCHA');
    } else {
        this.href = 'https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:8084/PRJ301-T4S4-JSP_V2/LoginGoogleController&response_type=code&client_id=52455849169-e99q1kcjktks7ei0d6b60p3e5u7nv4lf.apps.googleusercontent.com&approval_prompt=force';
    }
});

document.getElementById('loginForm').addEventListener('submit', function (event) {
    if (grecaptcha.getResponse() === '') {
        event.preventDefault();
        alert('Please complete the reCAPTCHA');
    }
});