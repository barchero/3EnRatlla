/**
 * @author Marc
 */

function startTimeout(){
	setInterval(function(){
		var contador = document.getElementById("contador");
		if(Number(contador.innerHTML) > 0){
			result = Number(contador.innerHTML)-1;
			contador.innerHTML = result;
		}else{
			window.location.href=window.location.href
		}
	}, 1000);	
}

 function select(selected){
     var sel_arr = selected.split("_");
     
     var x = document.getElementById('x');
     var y = document.getElementById('y');
     
     var sel_x = sel_arr[0];
     var sel_y = sel_arr[1];
     
     x.value = sel_x;
     y.value = sel_y;
     
     document.getElementById("main_form").submit;
     //alert(x.value+"//"+y.value);
 }