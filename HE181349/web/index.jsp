<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link
    rel="stylesheet"
    type="text/css"
    href="${pageContext.request.contextPath}/styles/index.css"
    />
</head>
<body>
    <div id="container" class="container">
        <div class="row">
            <div class="col align-items-center flex-col sign-up">
                <div class="form-wrapper align-items-center">
                    <div class="form sign-up">
                        <a href="/admin/login"><button>
                            ADMIN
                        </button></a>
                        <p>
                            <b onclick="toggle()" class="pointer">
                                I'm not a Admin
                            </b>
                        </p>
                    </div>
                </div>

            </div>
            <div class="col align-items-center flex-col sign-in">
                <div class="form-wrapper align-items-center">
                    <div class="form sign-in">
                        <a href="home"><button>
                            USER
                        </button></a>
                        <p>
                            <b onclick="toggle()" class="pointer">
                                I'm not a User
                            </b>
                        </p>
                    </div>
                </div>
                <div class="form-wrapper">

                </div>
            </div>
        </div>
        <div class="row content-row">
            <div class="col align-items-center flex-col">
                <div class="text sign-in">
                    <h2>
                        Welcome
                    </h2>

                </div>
                <div class="img sign-in">

                </div>
            </div>
            <div class="col align-items-center flex-col">
                <div class="img sign-up">
                </div>
                <div class="text sign-up">
                    <h2>
                        Join with us
                    </h2>
                </div>
            </div>
        </div>
    </div>
    <script>
        let container = document.getElementById('container')

        toggle = () => {
            container.classList.toggle('sign-in')
            container.classList.toggle('sign-up')
        }

        setTimeout(() => {
            container.classList.add('sign-in')
        }, 200)
    </script>
</body>
</html>