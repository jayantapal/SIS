
function insertTextBox(selectobject) {
	 alert("Insert text box called");
            if(selectobject.value=='Date Range'){

                document.getElementById("daterangeFrom").style.visibility="visible";
                document.getElementById("cal1").style.visibility="visible";

                document.getElementById("dateRangeTo").style.visibility="visible";
                document.getElementById("cal2").style.visibility="visible";

            }else {
                 document.getElementById("daterangeFrom").style.visibility="hidden";
                document.getElementById("cal1").style.visibility="hidden";

                 document.getElementById("dateRangeTo").style.visibility="hidden";
                document.getElementById("cal2").style.visibility="hidden";
            }

        }

        function showCalender(textObject){
            this.showCalendarControl(textObject);
        }

        function setDefault(){
            document.getElementById("timeframe").selected.value='Yearly';
        }