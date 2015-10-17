 $(document).ready( function () {
     countOrders();
    loadCalendar();
      var table = $('#orders').dataTable();
$('.orderTable').click(function(e){
    e.preventDefault();
    if($(this).attr('href') !== 'D'){
         $("#devDate").remove();
     table.fnClearTable();
     table.fnDestroy();
     $('#orders').dataTable( {
        "ajax": {
            "url":"LoadInProcessOrders?orderstatus=" + $(this).attr('href'),
            "dataSrc": ''
            
        },
        "columns": [
            { "data": "order_id" },
            { "data": "deliver_to" },
            { "data": "date_issued" },
            { "data": "order_date" },
            { "data": "statusCode"}
           
        ]
    } );
    }
    else{
        $("#devDate").remove();
        $("#devStatus").before("<th id=devDate>" + "<i class='fa fa-calendar'></i> DeliveryDate</th>");
         table.fnClearTable();
         table.fnDestroy();
         $('#orders').dataTable( {
        "ajax": {
            "url":"LoadDeliveredOrders?orderstatus=" + $(this).attr('href'),
            "dataSrc": ''
            
        },
        "columns": [
            { "data": "order_id" },
            { "data": "deliver_to" },
            { "data": "date_issued" },
            { "data": "order_date" },
             { "data": "date_delivered" },
            { "data": "statusCode"}
           
        ]
    } );
    }
   
    } );
     setInterval(function(){
    $.ajax({ url: "LoadOrderListNumbers", success: function(data){
       $("#delivered").text(data.deliveredOrderCount);
                $("#inprocess").text(data.inprocessOrderCount);
                $("#reordering").text(data.forReOrderingCount);
                $("#canceled").text(data.canceledOrderCount);
    }, dataType: "json"});
    }, 60000);
    } );
    
    function loadCalendar(){
         $.ajax({
            type: "GET",
            url: 'LoadDeliverySchedule',
            dataType: 'json',
            success: function(data) {
                $('#calendar').fullCalendar({
                    events:data,
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,basicWeek,basicDay'
                }
                 });
                }
            });
    }
    
    function countOrders(){
                 $.ajax({
            type: "GET",
            url: 'LoadOrderListNumbers',
            dataType: 'json',
            success: function(data) {
                $("#forreorder").text(data.forReOrderingCount);
                $("#delivered").text(data.deliveredOrderCount);
                $("#inprocess").text(data.inprocessOrderCount);
                 $("#canceled").text(data.canceledOrderCount);
                }
            });
            }
           