function Selected(s) {
    var label = s.value;
    if(label == 2) {
        document.getElementById("radio").style.display='block';
        document.getElementById("checkbox").style.display='none';
        console.log("try");
    } else if(label == 3) {
        document.getElementById("radio").style.display='none';
        document.getElementById("checkbox").style.display='block';
    }
    else {
        document.getElementById("radio").style.display='none';
        document.getElementById("checkbox").style.display='none';
    }
}