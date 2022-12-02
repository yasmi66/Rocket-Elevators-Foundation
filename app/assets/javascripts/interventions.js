// // FUNCTIONS FOR INTERVENTIONS PAGE

// // Hide dropdowns on start
// $(function() {

//     $("div#building-list").hide();
//     $("div#battery-list").hide();
//     $("div#column-list").hide();
//     $("div#elevator-list").hide();

//     // Start CUSTOMER SELECTION FUN
//     // show building dropdown on customer selection
//     $("select#customer").change(function() {
//         $("div#building-list").show();

//         let CustomerID = $(this).val();
//         console.log(CUSTOMAAAA);

//         // Hide fields when unselecting
//         if (CustomerID == "") {
//             $("div#building-list").hide();
//             $("div#battery-list").hide();
//             $("div#column-list").hide();
//             $("div#elevator-list").hide();
//             $("select#building option").remove();
//         } else {
//             $.ajax({
//                 dataType: "json",
//                 cache: false,
//                 url: '/get_buildings_by_customer/' + CustomerID,
//                 timeout: 5000,
//                 error: function(XMLHttpRequest, errorTextStatus, error) {
//                     alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
//                 },
//                 success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @buildings)
//                     // If a different customer is chosen, clear all the options from the building select
//                     $("select#building option").remove();
//                     //put in a empty row
//                     let default_row = "<option value=\"" + "" + "\">" + "--- Select ---" + "</option>";
//                     $(default_row).appendTo("select#building");
//                     // Fill building selection
//                     $.each(data, function(i, j) { // data = @buildings, i = index (ie. 0, 1, 2), j = the current building
//                         // Create a new <option> element for a building
//                         let row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + "</option>";
//                         // Append the <option> element to the <select>
//                         $(row).appendTo("select#building");
//                     });
//                 }
//             });
//         }
//     }); 
//     // End CUSTOMER SELECTION FUN

//     // Start BUILDING SELECTION PARTY
//     // show battery dropdown on building selection
//     $("select#building").change(function() {
//         $("div#battery-list").show();

//         let BuildingID = $(this).val();
//         console.log(BUILD-ALL-THE-LINGS);

//         // Hide fields when unselecting
//         if (BuildingID == "") {
//             $("div#battery-list").hide();
//             $("div#column-list").hide();
//             $("div#elevator-list").hide();
//             $("select#battery option").remove();
//         } else {
//             // Send the request and update battery dropdown
//             $.ajax({
//                 dataType: "json",
//                 cache: false,
//                 url: '/get_batteries_by_building/' + BuildingID,
//                 timeout: 5000,
//                 error: function(XMLHttpRequest, errorTextStatus, error) {
//                     alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
//                 },
//                 success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @batteries)
//                     // If a different building is instead selected, clear all options from battery select
//                     $("select#battery option").remove();
//                     //put in a empty default line
//                     let default_row = "<option value=\"" + "" + "\">" + "None" + "</option>";
//                     $(default_row).appendTo("select#battery");
//                     // Fill battery select
//                     $.each(data, function(i, j) { // data = @batteries, i = index (ie. 0, 1, 2), j = the current battery
//                         // Create a new <option> element for a building
//                         let row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + " - " + j.status + "</option>";
//                         // Append the <option> element to the <select>
//                         $(row).appendTo("select#battery");
//                     });
//                 }
//             });
//         }
//     }); 
//     // End BUILDING SELECTION PARTY

//     // Start BATTERY SELECTION ADVENTURE
//     $("select#battery").change(function() {
//         // show column on battery selection
//         $("div#column-list").show();

//         let BatteryID = $(this).val();
//         console.log(BATTERRRRAAAAAYYYYY);

//         // hide when unselecting
//         if (BatteryID == "") {
//             $("div#column-list").hide();
//             $("div#elevator-list").hide();
//             $("select#column option").remove();
//         } else {
//             $.ajax({
//                 dataType: "json",
//                 cache: false,
//                 url: '/get_columns_by_batteries/' + BatteryID,
//                 timeout: 5000,
//                 error: function(XMLHttpRequest, errorTextStatus, error) {
//                     alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
//                 },
//                 success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @columns)
//                     // If a different battery is instead selected, clear all options from column select
//                     $("select#column option").remove();
//                     //put in a empty default line
//                     let default_row = "<option value=\"" + "" + "\">" + "None" + "</option>";
//                     $(default_row).appendTo("select#column");
//                     // Fill column select
//                     $.each(data, function(i, j) { // data = @columns, i = index (ie. 0, 1, 2), j = the current column
//                         // Create a new <option> element for a column
//                         let row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + " - " + j.status + "</option>";
//                         // Append the <option> element to the <select>
//                         $(row).appendTo("select#column");
//                     });
//                 }
//             });
//         }
//     }); 
//     // End BATTERY SELECTION ADVENTURE

//     // Start COLUMN ENDING IT ALL
//     // show elevator dropdown field on column selection
//     $("select#column").change(function() {
//         $("div#elevator-list").show();

//         // Grab the value (ie. id) of the current selected column
//         let ColumnID = $(this).val();
//         console.log(COLONOSCOPY);

//         // hide when unselecting
//         if (ColumnID == "") {
//             $("div#elevator-list").hide();
//             $("select#elevator option").remove();
//         } else {
//             $.ajax({
//                 dataType: "json",
//                 cache: false,
//                 url: '/get_elevators_by_columns/' + column_id,
//                 timeout: 5000,
//                 error: function(XMLHttpRequest, errorTextStatus, error) {
//                     alert("Failed to reach submit : " + errorTextStatus + " ;" + error);
//                 },
//                 success: function(data) { // The 'data' variable SHOULD hold the json object you just requested (ie. @elevators)
//                     // If a different column is instead selected, clear all options from elevator select
//                     $("select#elevator option").remove();
//                     //put in a empty default line
//                     let default_row = "<option value=\"" + "" + "\">" + "None" + "</option>";
//                     $(default_row).appendTo("select#elevator");
//                     // Fill elevator select
//                     $.each(data, function(i, j) {
//                         let row = "<option value=\"" + j.id + "\">" + "ID: " + j.id + " - " + j.status + "</option>";
//                         $(row).appendTo("select#elevator");
//                     });
//                 }
//             });
//         }
//     }); 
//     // End COLUMN ENDING IT ALL
// });