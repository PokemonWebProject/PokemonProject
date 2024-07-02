window.addEventListener("DOMContentLoaded", function() {
    const checkAlls = document.getElementsByClassName("checkall");

    for (const el of checkAlls) {
        el.addEventListener("click", function() {
            const targetName = this.dataset.targetName;
            if (!targetName) {
                return;
            }

            const chks = document.getElementsByName(targetName);
            for (const chk of chks) {
                chk.checked = this.checked;
            }
        });
    }
});