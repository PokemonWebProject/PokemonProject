const fileManager = {

    upload(files, gid, location) {
        gid = "" + gid;
        try {
            if (files.length == 0) {
                throw new alert("업로드할 파일을 선택하세요.");
            }

            if (!gid || !gid.trim()) {
                throw new alert("잘못된 접근입니다.");
            }

            const formData = new FormData();
            formData.append("gid", ("" + gid).trim());

            if (location && location.trim()) {
                formData.append("location", location);
            }

            for(const file of files) {
                formData.append("file", file);
            }

            const rootUrl = document.querySelector("meta[name='rootUrl']").content;
            const apiUrl = `${rootUrl}file/upload`;
            alert(apiUrl);
            fetch(apiUrl, {
                method: 'POST',
                cache: 'no-cache',
                body: formData
            })
                .then(res => res.json())
                .then(json => {
                    // callbackFileUpload라는 함수만 정의하면 그후 처리는 각 상황에 맞게 처리
                    if (typeof callbackFileUpload === 'function') {
                        callbackFileUpload(json);
                    }
                });

        } catch (err) {
            alert(err.message);
        }


    }
};