// JavaScript to make the image follow the mouse
document.addEventListener('mousemove', function(e) {
    const followImage = document.getElementById('follow-image');
    followImage.style.left = e.pageX + 'px';
    followImage.style.top = e.pageY + 'px';
    followImage.style.display = 'block';
});