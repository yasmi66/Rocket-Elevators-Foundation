jQuery ->
    building = $('#intervention_BuildingID').html()
    $('#intervention_CustomerID').click ->
        customer = $('#intervention_CustomerID :selected').text()
        options1 = $(building).filter("optgroup[label='#{customer}']").html()

        if options1
            $('#intervention_BuildingID').html(options1)
        else
            $('#intervention_BuildingID').empty()

    battery = $('#intervention_BatteryID').html()
    $('#intervention_BuildingID').click ->
        building = $('#intervention_BuildingID :selected').text()
        options2 = $(battery).filter("optgroup[label='#{building}']").html()

        if options2
            $('#intervention_BatteryID').html(options2)
        else
            $('#intervention_BatteryID').empty()    

    column = $('#intervention_ColumnID').html()
    $('#intervention_BatteryID').click ->
        $('#intervention_ColumnID').html(options3).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
        battery = $('#intervention_BatteryID :selected').text()
        options3 = $(column).filter("optgroup[label='#{battery}']").html()

        if options3
            $('#intervention_ColumnID').html(options3).val("Find a Column").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#intervention_ColumnID').html(options3)
            $('#intervention_ColumnID').html(options3).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")


        else
            $('#intervention_ColumnID').empty()

    elevator = $('#intervention_ElevatorID').html()
    $('#intervention_ColumnID').click ->
        $('#intervention_ElevatorID').html(options4).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
        column = $('#intervention_ColumnID :selected').text()
        options4 = $(elevator).filter("optgroup[label='#{column}']").html()

        if options4
            $('#intervention_ElevatorID').html(options4).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#intervention_ElevatorID').html(options4)
            $('#intervention_ElevatorID').html(options4).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")

        else
            $('#intervention_ElevatorID').empty()