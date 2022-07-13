//function getUniqueValuesFromColumn() {
//
//    var unique_col_values_dict = {};
//
//    allFilters = document.querySelectorAll(".table-filter");
//    allFilters.forEach((filter_i) => {
//        col_index = filter_i.parentElement.getAttribute("col-index");
//        // alert(col_index)
//        const rows = document.querySelectorAll("#emp-table > tbody > tr");
//
//        rows.forEach((row) => {
//            cell_value = row.querySelector("td:nth-child(" + col_index + ")").innerHTML;
//            // if the col index is already present in the dict
//            if (col_index in unique_col_values_dict) {
//
//                // if the cell value is already present in the array
//                if (unique_col_values_dict[col_index].includes(cell_value)) {
//                    // alert(cell_value + " is already present in the array : " + unique_col_values_dict[col_index])
//
//                } else {
//                    unique_col_values_dict[col_index].push(cell_value);
//                    // alert("Array after adding the cell value : " + unique_col_values_dict[col_index])
//
//                }
//
//
//            } else {
//                unique_col_values_dict[col_index] = new Array(cell_value);
//            }
//        });
//
//
//    });
//
//    for (i in unique_col_values_dict) {
//        alert("Column index : " + i + " has Unique values : \n" + unique_col_values_dict[i]);
//    }
//
//    updateSelectOptions(unique_col_values_dict);
//
//}
//;
//
//// Add <option> tags to the desired columns based on the unique values
//
//function updateSelectOptions(unique_col_values_dict) {
//    allFilters = document.querySelectorAll(".table-filter");
//
//    allFilters.forEach((filter_i) => {
//        col_index = filter_i.parentElement.getAttribute('col-index');
//
//        unique_col_values_dict[col_index].forEach((i) => {
//            filter_i.innerHTML = filter_i.innerHTML + `\n<option value="${i}">${i}</option>`;
//        });
//
//    });
//}
//;
//
//
//// Create filter_rows() function
//
//// filter_value_dict {2 : Value selected, 4:value, 5: value}
//
//function filter_rows() {
//    allFilters = document.querySelectorAll(".table-filter");
//    var filter_value_dict = {};
//
//    allFilters.forEach((filter_i) => {
//        col_index = filter_i.parentElement.getAttribute('col-index');
//
//        value = filter_i.value;
//        if (value !== "all") {
//            filter_value_dict[col_index] = value;
//        }
//    });
//
//    var col_cell_value_dict = {};
//
//    const rows = document.querySelectorAll("#emp-table tbody tr");
//    rows.forEach((row) => {
//        var display_row = true;
//
//        allFilters.forEach((filter_i) => {
//            col_index = filter_i.parentElement.getAttribute('col-index');
//            col_cell_value_dict[col_index] = row.querySelector("td:nth-child(" + col_index + ")").innerHTML;
//        });
//
//        for (var col_i in filter_value_dict) {
//            filter_value = filter_value_dict[col_i];
//            row_cell_value = col_cell_value_dict[col_i];
//
//            if (row_cell_value.indexOf(filter_value) === -1 && filter_value != "all") {
//                display_row = false;
//                break;
//            }
//
//
//        }
//
//        if (display_row === true) {
//            row.style.display = "table-row";
//
//        } else {
//            row.style.display = "none";
//
//        }
//    });
//
//}
//
////function filterTable() {
////    // Variables
////    let dropdown, table, rows, cells, country, filter;
////    dropdown = document.getElementById("typeDropdown");
////    table = document.getElementById("myTable");
////    rows = table.getElementsByTagName("tr");
////    filter = dropdown.value;
////
////    // Loops through rows and hides those with countries that don't match the filter
////    for (let row of rows) { // `for...of` loops through the NodeList
////        cells = row.getElementsByTagName("td");
////        country = cells[1] || null; // gets the 2nd `td` or nothing
////        // if the filter is set to 'All', or this is the header row, or 2nd `td` text matches filter
////        if (filter === "All" || !country || (filter === country.textContent)) {
////            row.style.display = ""; // shows this row
////        } else {
////            row.style.display = "none"; // hides this row
////        }
////    }
////}
//<script>
                //window.onload = () => {
                    //console.log(document.querySelector("#emp-table > tbody > tr:nth-child(1) > td:nth-child(2) ").innerHTML);
              //  };

               // getUniqueValuesFromColumn()

//</script>-->