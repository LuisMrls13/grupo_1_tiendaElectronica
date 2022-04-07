window.addEventListener("load",()=>{
    
   
    if( sessionStorage.getItem("SeEquivoco")=="Si")
        alert("Usuario y/o contraseña incorrecta")
    
    sessionStorage.setItem("SeEquivoco","Si")

});