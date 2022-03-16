
function validar() {
    var Nombres, Apellido, Edad, Correo_Electrónico_registro, Contraseña_registro, Correo_Electronico_sesion, Contraseña_sesion, Contraseña_sesion_confirmacion;
    Nombres = document.getElementById("Nombres").value;
    Apellido = document.getElementById("Apellidos").value;
    Edad = document.getElementById("Edad").value;
    Correo_Electrónico_registro = document.getElementById("Correo_Electronico_registro").value;
    Contraseña_registro = document.getElementById("Contraseña_registro").value;
    Contraseña_sesion_confirmacion = document.getElementById("Contraseña_registro_confirmacion").value;

    localStorage.setItem('Nombre', Nombres);
    localStorage.setItem('Apellido', Apellido);
    localStorage.setItem('Edad', Edad);
    localStorage.setItem('Correo_Electrónico', Correo_Electrónico_registro);
    localStorage.setItem('Contraseña', Contraseña_registro);
    localStorage.setItem('Nombre', Nombres);

    if (Nombres == "") {
        alert("Ingrese su nombre por favor")
    } else if (Apellido == "") {
        alert("Ingrese sus Apellidos por favor")
    } else if (Edad == "") {
        alert("Ingrese su edad")
    } else if (Edad < 18){
        alert("No se permite registrar a menores de edad");
    }else if (Correo_Electrónico_registro == "") {
        alert("Ingrese su correo electrónico")
    } else if (Contraseña_registro == "") {
        alert("Ingrese su contraseña")}
        else
    if (Contraseña_registro !== Contraseña_sesion_confirmacion) {
    alert("La contraseña no coincide");
    document.getElementById("Contraseña_registro_confirmacion").value = "";
    }
    else{
        alert("¡Se registro los datos con exito!");
        document.getElementById("Nombres").value = "";
        document.getElementById("Apellidos").value = "";
        document.getElementById("Edad").value = "";
        document.getElementById("Correo_Electronico_registro").value = "";
        document.getElementById("Contraseña_registro").value = "";
        document.getElementById("Contraseña_registro_confirmacion").value = "";
        /*mostrar inision de sesion*/ 
        var ocultar_registro = document.getElementById("form_registro");
        var mostrar_sesion = document.getElementById("form_sesion");
        if (mostrar_sesion.style.display === "none") {
            mostrar_sesion.style.display = "block";
            ocultar_registro.style.display = "none";
        } 
    }
   
}
function reload_sesion() {
    var ocultar_registro = document.getElementById("form_registro");
        var mostrar_sesion = document.getElementById("form_sesion");
        if (mostrar_sesion.style.display === "none") {
            mostrar_sesion.style.display = "block";
            ocultar_registro.style.display = "none";
        } else
        if (ocultar_registro.style.display === "none") {
            mostrar_sesion.style.display = "none";
            ocultar_registro.style.display = "block";
        }
}
    function validar_sesion() {
        Correo_Electronico_sesion = document.getElementById("Correo_Electronico_sesion").value;
        Contraseña_sesion = document.getElementById("Contraseña_sesion").value;

        if(Contraseña_sesion == localStorage.getItem("Contraseña") && Correo_Electronico_sesion == localStorage.getItem("Correo_Electrónico")){
            var ocultar_sesion = document.getElementById("form_sesion");
            var mostrar_envio_mensaje = document.getElementById("form_mensaje");
            if (ocultar_sesion.style.display === "block") {
                ocultar_sesion.style.display = "none";
                mostrar_envio_mensaje.style.display = "block";
            }
        }else
        if(Contraseña_sesion == "") {
            alert("Ingrese Correo electronico")

        }else
        if(Correo_Electronico_sesion == "") {
            alert("Ingrese Correo electronico")

        }else
        if (Correo_Electronico_sesion !== localStorage.getItem("Correo_Electrónico")) {
            alert("Correo electronico incorrecto")
        }else
        if (Contraseña_sesion !== localStorage.getItem("Contraseña")) {
        alert("Contraseña incorrecta")
        document.getElementById("Contraseña_sesion").value = "";
    }
        if(Correo_Electronico_sesion = ""){
            alert("Ingrese correo electrónico")
        }
        
    }
    function enviar_mensaje() {
        var receptor, asunto, mensaje;
        receptor = document.getElementById("Correo_Electronico_para").value;
        asunto = document.getElementById("asunto_mensaje").value;
        mensaje = document.getElementById("mensaje").value;

        localStorage.setItem("Receptor", receptor);
        localStorage.setItem("Asunto", asunto);
        localStorage.setItem("Mensaje", mensaje);

        if(receptor == "")
        {
            alert("Ingrese el correo para quien va dirigido");
        }
        else if ( asunto == "") {
            alert("Ingrese Asunto del mensaje");
        }
        else if (mensaje == "") {
            alert("Ingrese mensaje a enviar");
        }
        else {
            alert("Mensaje Enviado");
            document.getElementById("Correo_Electronico_para").value = "";
        document.getElementById("asunto_mensaje").value = "";
        document.getElementById("mensaje").value = "";
        }

    }
    function ver_mensaje () {
        document.getElementById("muestra_receptor").innerHTML = localStorage.getItem("Receptor");
        document.getElementById("muestra_asunto").innerHTML = localStorage.getItem("Asunto");
        document.getElementById("muestra_mensaje").innerHTML = localStorage.getItem("Mensaje");
        
        var ocultar_envio = document.getElementById("form_mensaje");
        var mostrar_mensaje = document.getElementById("vista_mensajes");
        if (ocultar_envio.style.display === "block") {
            ocultar_envio.style.display = "none";
            mostrar_mensaje.style.display = "block";
        }
    }
    function div_enviar_mensaje() {
        var ocultar_ver_mensaje = document.getElementById("vista_mensajes");
        var mostrar_enviar_mensaje = document.getElementById("form_mensaje");
        if (ocultar_ver_mensaje.style.display === "block") {
            ocultar_ver_mensaje.style.display = "none";
            mostrar_enviar_mensaje.style.display = "block";
        }

    }
	function cerrar_sesion() {
		var ocultar_registro = document.getElementById("form_mensaje");
        var mostrar_sesion = document.getElementById("form_sesion");
        if (mostrar_sesion.style.display === "none") {
			document.getElementById("Correo_Electronico_sesion").value = "";
			document.getElementById("Contraseña_sesion").value = "";
            mostrar_sesion.style.display = "block";
            ocultar_registro.style.display = "none";
        }
	}