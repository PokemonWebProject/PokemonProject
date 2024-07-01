// script.js
document.addEventListener('DOMContentLoaded', function() {
    var buttons = document.querySelectorAll('.bubble-button');
    buttons.forEach(function(button) {
        button.addEventListener('click', function(e) {
            var rect = button.getBoundingClientRect();
            var x = e.clientX - rect.left;
            var y = e.clientY - rect.top;

            var ripple = document.createElement('span');
            ripple.classList.add('ripple');
            ripple.style.left = `${x}px`;
            ripple.style.top = `${y}px`;

            button.appendChild(ripple);

            setTimeout(() => {
                ripple.remove();
            }, 600);
        });
    });
});