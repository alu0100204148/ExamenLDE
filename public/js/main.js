$(document).ready(function() {
	var n;
  $('#PARSE').click(function() {
    try {
      var result = DSLEx.parse($('#original').val());
      $('#OUTPUT').html(JSON.stringify(result,undefined,2));
    } catch (e) {
      $('#OUTPUT').html('<div class="error"><pre>\n' + String(e) + '\n</pre></div>');
    }
  });
  
  $('#PREVIEW').click(function() {
    n = window.open("preview.html", "_blank");
    var result = DSLExGenerator.parse($('#original').val());
    var res = result.replace(/>,</g, "><");
    n.document.write(res + '<br/><button id=\"results\">Resultados</button><script type=\"text/javascript\" src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js\"></script><script type=\"text/javascript\">(function() {		$(\"#results\").click(function() {			var aux = 0;			var nPreg = 0;			$(\'input[value=\"1\"]\').each(function() {     		nPreg++;			});			$(\'input:checked\').each(function() {     		if($(this).attr(\"ver\") == \"V\"){     			aux++;     		}			});			alert(\"Ha acertado \" + aux.toString() + \" de \" + nPreg + \" preguntas.\");		});}());</script>');
  });
  
  $('#GETHTML').click(function() {
      var result = DSLExGenerator.parse($('#original').val());
      var res = result.replace(/>,</g, "><");
      result = res.replace(/</g, '&lt;');
      res = result.replace(/>/g, '&gt;');
      $('#OUTPUT').html("<br>" + res);
  });

  $("#examples").change(function(ev) {
    var f = ev.target.files[0]; 
    var r = new FileReader();
    r.onload = function(e) { 
      var contents = e.target.result;
      
      input.innerHTML = contents;
    }
    r.readAsText(f);
  });

});
