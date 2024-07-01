window.addEventListener("DOMContentLoaded", function() {

    ClassicEditor.create(document.getElementById("artBody"), {
            height: 350
        })
        .then((editor) => {
            window.editor = editor;
        });
});