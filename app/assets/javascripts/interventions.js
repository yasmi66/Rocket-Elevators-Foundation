// FUNCTIONS FOR INTERVENTIONS PAGE
$(function() {
    // Hide all dropdowns on page load
    // $("div#building-list").hide();
    // $("div#battery-list").hide();
    // $("div#column-list").hide();
    // $("div#elevator-list").hide();

    // CUSTOMER
    $("select#customer").change(function() {
        // show building dropdown on selection
        $("div#building-list").show();

        var customer_id = $(this).val();
        console.log(customer_id);

        // Hide when unselecting
        if (customer_id == "") {
            $("div#building-list").hide();
            $("div#battery-list").hide();
            $("div#column-list").hide();
            $("div#elevator-list").hide();
            $("select#building option").remove();
        } else {
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_buildings_by_customer/' + customer_id,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @buildings)
                    // If a different customer is instead selected, clear all the options from the building select
                    $("select#building option").remove();
                    //put in a empty default line
                    var def_row = "<option value=\"" + "" + "\">" + "--- Select ---" + "</option>";
                    $(def_row).appendTo("select#building");
                    // Fill building select
                    $.each(data, function(i, j) { // data = @buildings, i = index (ie. 0, 1, 2), j = the current building
                        // Create a new <option> element for a building
                        var row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + "</option>";
                        // Append the <option> element to the <select>
                        $(row).appendTo("select#building");
                    });
                }
            });
        }
    }); 
    // End CUSTOMER

    // BUILDING
    $("select#building").change(function() {
        // show battery on building selection
        $("div#battery-list").show();

        var building_id = $(this).val();
        console.log(building_id);

        // Hide when unselecting
        if (building_id == "") {
            $("div#battery-list").hide();
            $("div#column-list").hide();
            $("div#elevator-list").hide();
            $("select#battery option").remove();
        } else {
            // Send the request and update battery dropdown
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_batteries_by_building/' + building_id,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @batteries)
                    // If a different building is instead selected, clear all options from battery select
                    $("select#battery option").remove();
                    //put in a empty default line
                    var def_row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                    $(def_row).appendTo("select#battery");
                    // Fill battery select
                    $.each(data, function(i, j) { // data = @batteries, i = index (ie. 0, 1, 2), j = the current battery
                        // Create a new <option> element for a building
                        var row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + " - " + j.status + "</option>";
                        // Append the <option> element to the <select>
                        $(row).appendTo("select#battery");
                    });
                }
            });
        }
    }); 
    // End BUILDING

    // BATTERY
    $("select#battery").change(function() {
        // show column on battery selection
        $("div#column-list").show();

        var battery_id = $(this).val();
        console.log(battery_id);

        // hide when unselecting
        if (battery_id == "") {
            $("div#column-list").hide();
            $("div#elevator-list").hide();
            $("select#column option").remove();
        } else {
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_columns_by_batteries/' + battery_id,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @columns)
                    // If a different battery is instead selected, clear all options from column select
                    $("select#column option").remove();
                    //put in a empty default line
                    var def_row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                    $(def_row).appendTo("select#column");
                    // Fill column select
                    $.each(data, function(i, j) { // data = @columns, i = index (ie. 0, 1, 2), j = the current column
                        // Create a new <option> element for a column
                        var row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + " - " + j.status + "</option>";
                        // Append the <option> element to the <select>
                        $(row).appendTo("select#column");
                    });
                }
            });
        }
    }); 
    // End BATTERY

    // COLUMN
    $("select#column").change(function() {
        // show elevator dropdown on column selection
        $("div#elevator-list").show();

        // Grab the value (ie. id) of the current selected column
        var column_id = $(this).val();
        console.log(column_id);

        // hide when unselecting
        if (column_id == "") {
            $("div#elevator-list").hide();
            $("select#elevator option").remove();
        } else {
            $.ajax({
                dataType: "json",
                cache: false,
                url: '/get_elevators_by_columns/' + column_id,
                timeout: 5000,
                error: function(XMLHttpRequest, errorTextStatus, error) {
                    alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
                },
                success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @elevators)
                    // If a different column is instead selected, clear all options from elevator select
                    $("select#elevator option").remove();
                    //put in a empty default line
                    var def_row = "<option value=\"" + "" + "\">" + "None" + "</option>";
                    $(def_row).appendTo("select#elevator");
                    // Fill elevator select
                    $.each(data, function(i, j) {
                        var row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + " - " + j.status + "</option>";
                        $(row).appendTo("select#elevator");
                    });
                }
            });
        }
    }); 
    // End COLUMN
});