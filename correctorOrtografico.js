var campo
$(document).ready(function () {
    campo = $(".validar");
    $("#botonVerificar").click(async function () {
            obtenerTexto()
            
            var texto = campo.text().trim();
            var posiblesReemplazosTabla = [];
        
            try {
                
                var data = await hacerSolicitudAjax(texto);
                
                var matches = data.matches;
        
                for (let i = 0; i < matches.length; i++) {
                    
                var context = matches[i].context;
                var palabraErronea = context.text.substring(context.offset, context.offset + context.length);
                var posiblesReemplazos = [palabraErronea];
        
                for (var j = 0; j < matches[i].replacements.length; j++) {
                    var replacement = matches[i].replacements[j];
                    posiblesReemplazos.push(replacement.value);
                    
                }
        
                posiblesReemplazosTabla.push(posiblesReemplazos);
                }
        
                // Llamar a eliminarDuplicados dentro de esta función
                posiblesReemplazosTabla = eliminarDuplicados(posiblesReemplazosTabla);
                imprimeCorrecciones(texto, posiblesReemplazosTabla, campo);
            } catch (error) {
                console.error("Error en la solicitud AJAX: " + error);
            }
    })



    $("#boton").click(function () {
        obtenerTexto()
        $("#contenidoEnviar").val($("#contenidoEditable").text());
    });
  });
  
  function hacerSolicitudAjax(texto) {
    return new Promise(function (resolve, reject) {
      $.get("https://api.languagetool.org/v2/check", { text: texto, language: "es" })
        .done(function (data) {
          resolve(data);
        })
        .fail(function (error) {
          reject(error);
        });
    });
  }
  
  
    function imprimeCorrecciones(texto, tabla, campo) {
      for (let i = 0; i < tabla.length; i++) {
        const opciones = tabla[i];
        var selectHTML = "<select style='border-bottom: 3px solid #ff9999; border-radius: 5px;'>";
        for (var j = 0; j < opciones.length; j++) {
          selectHTML += "<option value='" + opciones[j] + "'>" + opciones[j] + "</option>";
        }
        selectHTML += "</select>";
        texto = replaceAll(texto, tabla[i][0], selectHTML)
      }
      campo.html(texto);
    }
  
  
    function replaceAll(input, find, replace) {
      return input.split(find).join(replace);
    }
  
    function eliminarDuplicados(arr) {
      const objetoUnico = {};
      const resultado = [];
  
      for (let i = 0; i < arr.length; i++) {
        const elementoSerializado = JSON.stringify(arr[i]);
        if (!objetoUnico[elementoSerializado]) {
          objetoUnico[elementoSerializado] = true;
          resultado.push(arr[i]);
        }
      }
  
      return resultado;
    }
  
    function obtenerTexto() {
    var $div = campo
  
    var selects = $div.find("select");
  
    selects.each(function(index, select) {
      var valorSeleccionado = $(select).find("option:selected").text();
      $(select).replaceWith(valorSeleccionado);
    });    
    }

    //$('#form').submit(function() {
 
