<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkflowKanbanBoard.aspx.cs" Inherits="KanbanBoard.WorkflowKanbanBoard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />
    <link rel="stylesheet" href="../dhtmlx/dhtmlxKanban/dist/kanban.css"/>    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="../dhtmlx/dhtmlxKanban/dist/kanban.js"></script>
    <script src="https://snippet.dhtmlx.com/codebase/data/kanban/01/dataset.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <title>Kanban Board</title>
    <style>
        .html {
            font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
        }

        ul {
            list-style: none;
        }
       
        input:checked + .slider {
            background-color: #2196F3;
        }

        input:checked + .slider:before {
            transform: translateX(14px);
        }

        .icon-group {
            display: flex;
            align-items: center;
            border: 1px solid #ced4da;
            background-color: #fff;
            overflow: hidden;
            padding: 5px;
        }
        
        .icon-group > button {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px;
            border: none;
            background-color: transparent;
            cursor: pointer;
            height: 100%;
            margin-right: 5px;
        }

        .icon-group > button:last-of-type { margin-right: 0; }

        .icon-group > button:hover {
            background-color: #f0f0f0;
            border-radius: 3px;
        }

        .icon-group > button:focus { outline: none; }

        .icon-group .active { background-color: black; }

        button.btn--active {
            background: #f1f1f2;
            border: 1px solid #ececec;
            border-radius: 3px;
        }
    
        .btn-group{
            margin-left:15px;
            font-size:14px !important;
        }

        .dashboard {
            background-color: #EFEFEF;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .dashboard-header {
            margin-bottom: 20px;
            display:flex;
            justify-content: space-between;
        }

        .dashboard-header h2 {
            margin: 0;
        }

        .dashboard-controls {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #EFEFEF;
        }

        .dashboard-controls-left,
        .dashboard-controls-right {
            display: flex;
            align-items: center;
        }

        .dashboard-controls-left .icon,
        .dashboard-controls-right .icon {
            margin-right: 10px;
            cursor: pointer;
        }

        .dashboard-controls-left label,
        .dashboard-controls-right label {
            margin-right: 10px;
        }

        .dashboard-controls-left select,
        .dashboard-controls-right select {
            padding: 5px;
            margin-right: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .dashboard-controls-right .switch {
            display: flex;
            align-items: center;
        }

        .dashboard-controls-right .switch input {
            margin-right: 5px;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 20px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            border-radius: 34px;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 12px;
            width: 12px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            border-radius: 50%;
            transition: .4s;
        }

        input:checked + .slider {
            background-color: #2196F3;
        }

        input:checked + .slider:before {
            transform: translateX(21px);
        }
    
        .card-template {
            background: #fff;
            flex: 1;
            display: flex;
            align-items: center;
            padding: 10px;
            border-radius: 6px;
            margin: 5px 0;
        }

        .card-header {
            background-color: #007bff;
            color: white;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            width: 100%;
        }

        .dropdown-item {
            color: black; 
            font-size:14px;
        }

        .dropdown-item:hover {
            background-color: #f8f9fa; 
        }

        .workflow-container,
        .schedule-container,
        .workstep-container {
            padding: 0px 10px 10px;
            width: 100%;
        }

        .section.title-section {
  
            color:#9e9e9e;
            font-weight:600;
        }

        .title-section div {
            color: #7e7e7e;
            font-weight: 700;
        }

        .title-section {
            justify-content: flex-start;
        }

        .section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }

        .sub-label,
        .label {
            width: 48%;
        }

        .sub-label {
            padding-left: 15px;
        }

        .title {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
            width: 100%;
            font-weight: bold;
        }

        .section .value {
            display: flex;
            word-break: break-word;
            flex-wrap: wrap;
            gap: 5px;
            font-weight: bold;
            width: 40%;
        }

        .section img {
            width: 20px;
            height: 20px;
            border: 1px solid transparent;
            border-radius: 50%;
            margin-right: 5px;
        }

        .value-container {
            display: flex;
            width: 40%;
        }

        .value-container span {
            font-weight: bold;
            flex: 1;
        }

        .date-value{
            margin-right: 10px;
        }

        .selected {
            background-color: #f5f5f5;
        }

        #display-select,
        #status-select{
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: solid;
        }

        .card-template .status-color {
            border-radius: 50%;
            flex: 0 0 30px;
            height: 30px;
        }

        .card-template .label {
            font-size: 15px;
            font-weight: 500;
            flex: 1 1 auto;
            color:#0C6B93;
        }

        .card-template .menu-icon {
            cursor: pointer;
        }

            .card-template .menu-icon:hover {
                background-color: var(--wx-background-hover);
            }

        .avatar {
            vertical-align: middle;
            width: 20px;
            height: 20px;
            border-radius: 50%;
        }
        
        .wx-label{
            font-weight:bold;
        }

        /* card setup modal */
        .card-setup-container {
            display: none;
            border: 1px solid #d7d7d7;
            border-radius: 2px;
            box-shadow: 0px 4px 4px 0px #00000040;
            width: 316px;
            background: #fff;
            position: absolute;
            z-index: 10;
            top: 120px;
        }

        .card-setup-container__inner { padding: 10px 15px; }

        .card-setup-container__inner h1 {
            margin: 0 0 10px 0;
            font-size: 18px;
            font-weight: 700;
        }

        .inner__custom-client-project {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .inner__custom-client-project img {
            width: 13px;
            height: 13px;
            margin: auto 0;
            cursor: pointer;
        }

        .inner__field-selection {
            overflow-y: auto;
            height: 64vh;
            margin-bottom: 20px;
        }

        .inner__field-selection > ul { padding: 0px; }

        .inner__field-selection ul li ul { margin-top: 5px; }

        .inner__field-selection ul li { margin-bottom: 5px; }

        .inner__field-selection > ul li ul { padding: 0 0 0 22px; }

        .inner__field-selection input[type="checkbox"] { margin: 0 8px 0 0; }

        .inner__footer {
            width: fit-content;
            margin-left: auto;
        }

        .custom-modal__footer button,
        .inner__footer button {
            border: 1px solid transparent;
            border-radius: 3px;
            box-shadow: 0px 4px 4px 0px #00000040;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 15px;
        }

        .footer__close-btn,
        .footer__btn-cancel {
            background: #fff;
            border-color: #e9e9e9;
            margin-right: 5px;
        }

        .footer__apply-btn,
        .footer__btn-apply {
            background: #358852;
            color: #fff;
        }

        /* client/project custom modal */
        .custom-modal {
            display: none;
            width: 446px;
            padding: 10px;
            background: #fff;
            border: 1px solid #d7d7d7;
            box-shadow: 0px 4px 4px 0px #00000040;
            position: absolute;
            top: 40px;
            right: -455px;
        }

        .custom-modal h3 {
            font-size: 18px;
        }

        .custom-modal__body {
            margin: 15px 0;
        }

        .body__custom-container {
            border: solid;
            border-color: #F1F1F1;
            padding: 10px;
            margin-bottom: 15px;
        }

        .body__custom-input {
            /* remove default properties of browser */
            padding-block: unset;
            padding-inline: unset;
            box-sizing: border-box;
            width: 100%;
            /**/
            padding: 5px;
            margin-bottom: 15px;
        }

        .custom-modal__body p {
            line-height: 1;
            font-size: 14px;
            margin: 0 0 15px 0;
            color: #9C9EA0;
        }

        .custom-container__line {
            margin-bottom: 8px;
            cursor: pointer;
        }

        .custom-container__line:last-of-type { margin-bottom: 0; }

        .custom-container__line input[type=checkbox] { margin: 0 8px 0 0; }

        .custom-modal__footer {
            width: fit-content;
            margin-left: auto;
        }

        .footer__apply-btn { margin-right: 5px; }

        .footer__close-btn {
            margin: 0;
            background: #EFEFEF;
        }

        @media only screen and (max-width: 1280px) {
            .card-setup-container {
                left: 0;
                right: 0;
                margin: 0 auto;
            }

            .custom-modal {
                left: 0;
                right: 0;
                margin: 0 auto;
            }
        }

        .dropdown-menu > label { margin: 0; }

        .menu-item {
            display: block;
            cursor: pointer;
            padding: 5px 10px;
        }

        .menu-item:hover { background-color: #f8f9fa; }

        .menu-item:last-of-type { margin-bottom: 0; }

        .menu-item > input { margin-right: 5px; cursor: pointer; }

        .dropdown-toggle::after { display: none; }
        .wx-label.svelte-ms9wpd.svelte-ms9wpd{ font-weight:800; }
        .dashboard-controls-right{ margin-top:5px; }

        .project-search-dropdown {
            margin-left: 15px;
            height: 35px;
        }

        .project-search-dropdown > button {
            background: #f8f9fa;
            height: 100%;
            font-size: 13px;
        }

        .project-filter-button{
            border: none;
            background: white;
            width: 100%;
            justify-content: space-between;
            display: flex;
            align-items: center;
            outline: none;
            height: 35px;
            font-size: 13px;
        }

        .project-filter-button:hover {
            background: #E8E8E8;
            cursor: pointer;
        }

        .project-filter-button:focus,
        .button--active {
            background: #babfc7;
            outline: none;
        }

        .project-filter-dropdown {
            position: absolute;
            top: 0px;
            left: 160px;
            border: solid 1px;
            z-index: 10;
            background: white;
            width: max-content;
            border-color: #aaaaaa;
            font-size: 13px;
            max-height: 380px !important;
        }

        .project-filter-menu {
            border-color: #aaaaaa;
            border-top: 1px solid #babfc7;
            padding: 10px  0px 10px 10px;
            max-height: 300px;
            overflow-y: auto;
            max-width: 300px;;
        }

        .project-filter-menu > div { margin-bottom: 10px; }

        .project-filter-menu label { margin: 0; }

        .portfolio-filter-dropdown {
            position: absolute;
            left: 160px;
            top: 40px;
            border: solid 1px;
            z-index: 10;
            background: white;
            width: max-content;
            border-color: #aaaaaa;
            font-size: 13px;
            max-height: 380px !important;
        }

        .portfolio-filter-menu {
            border-color: #aaaaaa;
            border-top: 1px solid #babfc7;
            padding: 10px  0px 10px 10px;
            max-height: 300px;
            overflow-y: auto;
        }

        .search-portfolio {
            padding: 10px;
        }

        .search-project {
            padding: 10px;
        }

    </style>
    <script>
        var ViewMode = {
            List: 0,
            Detail: 1,
            Board: 2
        }

        const { Kanban, template } = kanban;

        const cardShape = {
            label: true,
            description: true,
            progress: true,
            start_date: true,
            end_date: true,
            users: {
                show: true,
                values: [],
            },
            priority: {
                show: true,
                values: [
                    { id: 1, color: "#FF5252", label: "High" },
                    { id: 2, color: "#FFC975", label: "Medium" },
                    { id: 3, color: "#65D3B3", label: "Low" },
                ],
            },
            color: true,
            menu: true,
            cover: true,
            attached: false,
        };

        var formatNameObj = {};
        var statuses = [];
        var isSwimlane = false;

        var statusIds = {
            All: -1,
            Active: 0,
            Completed: 1,
            Pending: 2,
            Cancelled: 8,
            Suspended: 22
        }

        // card setup data
        var fieldSelections = [];

        // variable to show Kanban view
        var kanbanBoard;
        var kanbanColumns = [];

        var workflowId = getParamValue("workflowId") ?? 0;

        // This enum is for due date dropdown selection
        var DueDateSelection = {
            SpecifyDateRange: 0,
            StartDateOnly: 1,
            EndDateOnly: 2
        }

        // This object is for user selection and input
        var dueDateOptions = {
            DueDateSelection: DueDateSelection.SpecifyDateRange,
            StartDate: 0,
            EndDate: 0
        };

        var TargetDateSelection = {
            OriginalDateRange: 0,
            CurrentDateRange: 1,
            NumberOfDaysDifference: 2
        }
        var targetDateOptions = {
            TargetDateSelection:  TargetDateSelection.OriginalDateRange,
            StartDate: 0,
            EndDate: 0
        };

        var listProject = [];
        var listWorkflowTemplateFilter = [];
        var listTaxReturnType = [];
        var listDifficulty = [];
        var listTeam = [];
        var listPortfolio = [];
        var portfolioSaved = [];
        var workflowData = [];

        var timer;
        var selectedProject = {
            id: -1,
            name: "",
            checked: false
        };
        var selectedPortfolio = {
            id: -1,
            name: "",
            checked: false
        };

        $(document).ready(function () {
            $("#swimlanes-toggle").change(function () {
               var isChecked = $(this).prop("checked");
           });

            $("#swimlanes-toggle").change(function () {
                isSwimlane = !isSwimlane;
                saveSwimlaneMode()
            });

            // should not close dropdown menu when click on
            $("#statusMenuContainer").on("click", (e) => {
                e.stopPropagation();
            });

            $("#projectFilterContainer").on("click", (e) => {
                e.stopPropagation();
            });
        });

        function pageLoad() {
            loadData();
        }

        // on click 'view mode' button
        function onSelectViewMode(viewMode = ViewMode.Board) {
            if (![ViewMode.List, ViewMode.Detail, ViewMode.Board].includes(viewMode)) return;

            if (viewMode !== ViewMode.Board) {
                // query to parent syntax
                window.parent.document.getElementById("DIVContact").style.display = "block";
                window.parent.document.getElementById("MainTableID").style.cssText = "padding-left: 220px; padding-right: 10px; width: 80%;";
                window.parent.document.getElementById("workStepKanban").setAttribute("src", "");
                window.parent.document.getElementById("workStepKanban").style.display = "none";
                window.location.href = `Javascript:parent.ToggleListView(${viewMode});`;
            }
        }

        // render Kanban board UI
        function renderKanbanBoard(columns = kanbanColumns, isUpdatedBoard = false, data = workflowData ?? cards) {
            // destructor() is remove all Kanban board config in UI
            if (isUpdatedBoard) kanbanBoard.destructor();
            // card info: data, column, row
            var cardData = [];
            var cardColumns = [];
            var cardRows = [];
            // total column labels to process below
            var totalColumns = columns.length ? [...columns.map(item => item.label)] : [];
            // total rows - swimlanes (workflow name)
            var totalRows = [];

            data.forEach((item, index) => {
                // columns
                totalColumns.push(item.WorkStepDescription ?? "");
                totalRows.push(`${item.WorkflowId}-${item.Description ?? ""}`);
                
                // card data
                var card = {
                    id: index + 1,
                    label: "",
                    priority: item.Priority,
                    color: "#65D3B3",
                    start_date: new Date("01/07/2021"),
                    users: [],
                    column: item.WorkStepDescription.replaceAll(" ", ""),
                    type: item.WorkflowId,
                    comments: [],
                    data: item
                };
                cardData.push(card);
            });

            // should not duplicate column
            totalColumns = [...new Set(totalColumns)];
            totalColumns.forEach(column => {
                var columnItem = {
                    id: column.replaceAll(" ", ""),
                    label: column,
                };

                cardColumns.push(columnItem);
            });

            totalRows = [...new Set(totalRows)];
            totalRows.forEach(row => {
                // ex: row is {id}-{description}
                var separateArr = row.split("-");
                var rowItem = {
                    id: separateArr[0],
                    label: separateArr.length > 1 ? separateArr[1] : ""
                };
                cardRows.push(rowItem);
            });
            // save column order to column order table in database after load page
            var columnOrder = JSON.stringify(cardColumns);
            ajaxPost("SaveColumnOrder", columnOrder, ajaxResultChecker(() => { }));

            // init kanban board
            kanbanBoard = new Kanban("#root", {
                columns: cardColumns,
                rows: cardRows,
                cards: cardData,
                cardTemplate: template(card => cardTemplate(card)),
                cardShape,
                readonly: {
                    edit: true, 
                    add: false, 
                    select: true, 
                    dnd: true 
                },
                editorShape: [],
                rowKey: "type" // config get which card field to be row key
            });

            // set value for global variable
            kanbanColumns = cardColumns;

            // should disabled opening editor in right side
            kanbanBoard.api.intercept("select-card", function(id, item) {
                // prevent the editor shape from opening
                return false;
            });

            kanbanBoard.api.on("move-column", (obj) => {
                var columnOrder = JSON.stringify(kanbanBoard.api.getState().columns);
                ajaxPost("SaveColumnOrder",  columnOrder, ajaxResultChecker(() => {}));
            });
        }

        function escapeHTML(str) {
            if (!str || !str?.length) return "";

            return str.replace(/[&<>'"]/g, tag => ({
                "&": "&amp;",
                "<": "&lt;",
                ">": "&gt;",
                "'": "&#39;",
                "\"": "&quot;"
            }[tag] || tag));
        }

        // render custom content for card
        function cardTemplate({ cardFields, selected }) {
            const { label, color } = cardFields;

            // apply formatNameObj to card label
            // ex: 1\4 (5) 2
            // split("") will separate all character in string
            var separateArr = formatNameObj.formatString.split("");
            var numberRegex = /\d/g;
            var cardLabel = "";
            separateArr.forEach(element => {
                if (!numberRegex.test(element)) {
                    cardLabel += element;
                    return;
                }

                var targetItem = formatNameObj.nameFormat.find(item => item.order.toString() === element && item.checked);
                if (targetItem) {
                    cardLabel += cardFields.data[targetItem.field];
                }
            });

            var cardHtml = `
                <div class="card-template ${selected ? "selected" : ""}">
                    <div class="label">${cardLabel}</div>
                    <div
                        class="menu-icon"
                        data-menu-id=${cardFields.id}
                        data-ignore-selection="true">
                            <i class="wxi-dots-v"></i>
                    </div>
                </div>`;

            var workflowField = fieldSelections.find(item => item.field === "Workflow");
            if (workflowField?.checked || workflowField?.indeterminate) {
                cardHtml += `<div class="workflow-container">
                    <div class="workflow-detail">
                        <div class="section title-section">
                            <div>Workflow</div>
                        </div>`;
                workflowField.children.forEach(item => {
                    cardHtml += `${(isShowTargetField(item)) ? `<div class="section">
                            <span class="label">${item.headerName}</span>
                            <span class="value">${escapeHTML(cardFields.data[item.field])}</span>
                        </div>` : ""}`;
                });
                cardHtml += "</div></div>";
            }

            var wsField = fieldSelections.find(item => item.field === "WorkStep");
            if (wsField?.checked || wsField?.indeterminate) {
                cardHtml += `<div class="workstep-container">
                    <div class="workstep-detail">
                        <div class="section title-section">
                            <div>Work Step</div>
                        </div>`;

                wsField.children.forEach(item => {
                    if (["Scheduled", "Actual"].includes(item.field)) {
                        cardHtml += `${(isShowTargetField(item)) ? `<div class="group-detail">
                            <div class="section">
                                <div>${item.headerName}</div>
                            </div>` : ""}`;
                        
                        item.children.forEach(childItem => {
                            cardHtml += `${(isShowTargetField(childItem)) ? `<div class="section">
                                    <span class="sub-label">${childItem.headerName}</span>
                                    <span class="value">${escapeHTML(cardFields.data[childItem.field])}</span>
                                </div>` : ""}`;
                        });
                        cardHtml += (isShowTargetField(item)) ? "</div>" : "";
                        return;
                    }

                    if (item.field === "AssignedTo") {
                        var imgUrl = cardFields.data["AssignedToImgUrl"];

                        cardHtml += `${(isShowTargetField(item)) ? `<div class="section">
                                    <span class="label">${item.headerName}</span>
                                    <div class="value-container">
                                        ${imgUrl !== "" ? `<img src="${escapeHTML(imgUrl)}" alt="avatar" style="margin-right: 5px;">` : ""}
                                        <span class="value">${escapeHTML(cardFields.data["AssignedDescription"])}</span>
                                    </div>
                                </div>` : ""}`;
                        return;
                    }

                    cardHtml += `${(isShowTargetField(item)) ? `<div class="section">
                            <span class="label">${item.headerName}</span>
                            <span class="value">${escapeHTML(cardFields.data[item.field])}</span>
                        </div>` : ""}`;
                });
                cardHtml += "</div></div>";
            }

            return cardHtml;
        }

        function isShowTargetField(field) {
            return field?.checked ?? false;
        }

        // load init data
        function loadData() {
            ajaxPost("GetColumnOrder", {}, ajaxResultChecker((result) => {
                kanbanColumns = result ? JSON.parse(result) : [];
                getViewSetup(() => {
                    generateCardSetup(fieldSelections, () => {
                        getListPortfolio(() => {
                            getListProject(() => {
                                getWorkflowTemplateForFilter(() => {
                                    getListDifficulty(() => {
                                        getTaxReturnTypeForFilter(() => {
                                            getWorkflowData(() => renderKanbanBoard());
                                        });
                                    });
                                });
                            });
                        });
                    });
                    generateClientProjDescCustom();
                });
            }));
        }
        
        // render card setup modal
        function generateCardSetup(data = fieldSelections, callback) {
            Promise.all([
                createNestedSortablesDefault(data, $("#fieldSelection"))
            ]).then(() => {
                // checked or indeterminate follow fieldSelections
                var dataWithoutChildren = getObjectsWithoutChildren(data);
                dataWithoutChildren.forEach(item => {
                    var checkboxElement = $(`input[type=checkbox]#${item.field}`, "#fieldSelection");
                    checkboxElement?.prop("checked", item.checked).trigger("change");
                });

                if (callback) callback();
            });
        }

        function generateClientProjDescCustom(data = formatNameObj) {
            var container = $("#customCheckboxContainer", "#customModal");
            if (!container || !container?.length) return;

            var htmlElements = "";
            container.empty();
            data.nameFormat.forEach(item => {
                var divLine = "<div class='custom-container__line'>";
                var label = "<label>";
                var checkbox = `<input id='${item.field}' name='${item.field}' type='checkbox' onchange="onSelectOptionName('${item.field}')"${item.checked ? " checked" : ""}>`;
                var spanName = `<span>${item.headerName}</span>`;
                label += `${checkbox}${spanName} (${item.order})</label>`;
                divLine += `${label}</div>`;
                htmlElements += divLine;
            });

            container.append(htmlElements);
            $("#customInput").val(data.formatString);
        }

        function saveFormatName(nameFormat, formatString) {
            var nameFormatString = JSON.stringify(nameFormat);

            ajaxPost("SaveFormatName", { nameFormatString, formatString }, ajaxResultChecker((result) => {
                if (result) {
                    // Implement here when save format name successfully
                    formatNameObj = {
                        nameFormat: nameFormat,
                        formatString: formatString
                    }
                }
                else {
                    alert("Can't save format name");
                }

            }));
        }

        function saveCardSetup(fieldSelection, callback) {
            var fieldSelectionString = JSON.stringify(fieldSelection);

            ajaxPost("SaveCardSetup", fieldSelectionString, ajaxResultChecker((result) => {
                if (result) {
                    // Implement here when save card setup successfully
                    if (callback) callback();
                }
                else {
                    alert("Can't save format name");
                }
            }));
        }

        function saveStatusSetup(statusSetup) {
            var statusSetupString = JSON.stringify(statusSetup);

            ajaxPost("SaveStatusSetup", statusSetupString, ajaxResultChecker((result) => {
                if (!result) alert("Can't save status");
            }));
        }

        function saveSwimlaneMode() {
            ajaxPost("SaveSwimlaneMode", isSwimlane, ajaxResultChecker((result) => {
                if (result) {
                    // Implement here when save swimlane mode successfully
                }
                else {
                    alert("Can't save swimlane mode");
                }
            }));
        }

        function getViewSetup(callback) {
            ajaxPost("GetViewSetup", {}, ajaxResultChecker((result) => {
                if (result) {
                    fieldSelections = (result.CardSetup.FieldSelection?.length > 0)
                        ? JSON.parse(result.CardSetup.FieldSelection)
                        : initialCardSetup();

                    // Get default format when can't get format
                    formatNameObj = !result.CardSetup.FormatString ? createDefaultFormat() : {
                        nameFormat: JSON.parse(result.CardSetup.NameFormat),
                        formatString: result.CardSetup.FormatString
                    }

                    // Get default status when can't get status
                    statuses = !result.Statuses ? createDefaultStatus() : JSON.parse(result.Statuses);
                    isSwimlane = result.SwimlaneMode;
                    setCheckboxStatuses(statuses);
                    setToggleSwimlanesMode();
                }
                else {
                    fieldSelections = initialCardSetup();
                    // Get default format when can't get card setup
                    formatNameObj = createDefaultFormat();
                    statuses = createDefaultStatus();
                    isSwimlane = false;
                    setCheckboxStatuses();
                    setToggleSwimlanesMode();
                }

                if (callback) callback();
            }));
        }

        // default client\project description custom data
        function createDefaultFormat() {
            var nameFormat = [
                { "headerName": "Client Long Name", "field": "ClientLongName", "checked": true, "order": 1 },
                { "headerName": "Client Short Name", "field": "ClientShortName", "checked": false, "order": 2 },
                { "headerName": "Client Code", "field": "ClientCode", "checked": false, "order": 3 },
                { "headerName": "Project Description", "field": "ProjectName", "checked": true, "order": 4 },
                { "headerName": "Project Code", "field": "ProjectCode", "checked": true, "order": 5 }
            ]
            var formatString = "1\\4 (5)";

            return { nameFormat: nameFormat, formatString: formatString };
        }

        function createDefaultStatus() {
            return [
                { "name": "Active", "id": statusIds.Active, "checked": true, },
                { "name": "Completed", "id": statusIds.Completed, "checked": true, },
                { "name": "Pending", "id": statusIds.Pending, "checked": true, },
                { "name": "Cancelled", "id": statusIds.Cancelled, "checked": true, },
                { "name": "Suspended", "id": statusIds.Suspended, "checked": true,},
            ]
        }
        
        function onClickCustomFieldNameSetting() {
            toggleCustomModal(false, true);
        }

        function toggleCustomModal(isShow = false, isClickSettingIcon = false) {
            var customModal = $("#customModal");
            if (isClickSettingIcon) {
                customModal?.toggle();
            } else {
                customModal?.toggle(isShow);
            }
        }

        // Get the desired parameter value from parameters passed to page.
        function getParamValue(paramName) {
            var url = window.location.search.substring(1); //get rid of "?" in query string
            var qArray = url.split('&'); //get key-value pairs
            for (var i = 0; i < qArray.length; i++) {
                var pArr = qArray[i].split('='); //split key and value
                if (pArr[0] == paramName)
                    return pArr[1].replaceAll('%27', '').replaceAll('_', ' '); //return value
            }
        }

        function onClickCardSetupBtn() {
            toggleCardSetupModal(false, true);
        }

        function toggleCardSetupModal(isShow = false, isClickBtn = false) {
            var cardSetupModal = $("#cardSetup");
            if (isClickBtn) {
                cardSetupModal.toggle();
            } else {
                cardSetupModal.toggle(isShow);
            }
        }
        
        function onClickApplyCardSetup() {
            fieldSelections = getAllOrSelectedItemsFromCardSetup(true);
            saveCardSetup(fieldSelections, () => {
                toggleCardSetupModal();
                renderKanbanBoard(kanbanColumns, true);
            });
        }

        function applyFormatName() {
            // update new values
            formatNameObj.nameFormat.forEach(item => {
                var isChecked = $(`input[id=${item.field}]`, "#customCheckboxContainer").is(":checked");
                item.checked = isChecked;
            });
            formatNameObj.formatString = $("#customInput").val();
            
            // If user do not input the format or clear the input, let everything return to default 
            if (formatNameObj.nameFormat.every(item => item.checked === false) || formatNameObj.formatString === "") {
                formatNameObj = createDefaultFormat();
            }

            saveFormatName(formatNameObj.nameFormat, formatNameObj.formatString);

            // apply format name to header of card
            renderKanbanBoard(kanbanColumns, true);
            toggleCustomModal();
        }

        function onCloseCustomModal() {
            // should update old value again when user close the custom modal
            formatNameObj.nameFormat.forEach(item => {
                $(`input[id=${item.field}]`, "#customCheckboxContainer").prop("checked", item.checked);
            });
            $("#customInput").val(formatNameObj.formatString);
            toggleCustomModal();
        }

        function onSelectOptionName(field) {
            var optionSelected = {};
            var targetOption = formatNameObj.nameFormat.find(item => item.field === field);
            if (targetOption) {
                var checked = $(`input[id=${field}]`, "#customCheckboxContainer").is(":checked");
                optionSelected = {...targetOption, checked: checked};
            }

            updateValueInputFormatName(optionSelected);
        }

        function updateValueInputFormatName(optionSelected) {
            var input = $("#customInput")
            var detached = input.val().split("");

            if (optionSelected.checked){
                if (!detached.includes(optionSelected.order.toString())){
                    detached.push(optionSelected.order.toString())
                }
            } else {
                if (detached.includes(optionSelected.order.toString())){
                    detached = detached.filter(char => char !== optionSelected.order.toString());
                }
            }

            var valueInput = detached.join('');
            input.val(valueInput);
        }

        function onKeyupFormatNameString(event) {
            var input = $("#customInput");
            if (!input) return;

            // do not allow to input alphabet character
            var regex = new RegExp(/[a-zA-Z]+/g);
            var inputValue = input.val();

            if (regex.test(event.key)) {
                inputValue = inputValue.replace(event.key, "");
                input.val(inputValue)
            }
            
            onChangeCustomInput();
        }

        function onChangeCustomInput(arr = [...formatNameObj.nameFormat]) {
            var inputValue = $("#customInput").val();
            var sanitizedValue = inputValue.replace(/[^\d\W]+/g, '');
            $("#customInput").val(sanitizedValue);
            sanitizedValue = sanitizedValue.split("");
            var sortedArray = [];
            var resultArray = sanitizedValue.forEach(item => {
                if (!isNaN(item) && Number(item) < 6 && Number(item) > 0) {
                    sortedArray.push(item);
                }
            });

            sortedArray = sortedArray.sort((a, b) => a - b);
            arr.forEach(element => {
                $(`.custom-container__line input[name=${element?.field}]`).prop("checked", false);
            });
        
            var notSelectedItem = [...arr]

            for (var index = 0; index < sortedArray.length; index++) {
                var selection = arr.find(value => value.order.toString() === sortedArray[index][0]);
                notSelectedItem = notSelectedItem.filter(value => value.order.toString() !== sortedArray[index].toString());

                if (selection) {
                    $(`.custom-container__line input[id=${selection?.field}]`).prop("checked", true);
                }
            }

            notSelectedItem.forEach(value=> {
                $(`.sortable-item input[name=${value?.field}]`).prop("checked", false);
            })
        }

        function getWorkflowData(callback) {
            var requestParams = createGetWorkflowDataRequest();
            ajaxPost("GetWorkflowData", requestParams, 
                ajaxResultChecker((res) => {
                    workflowData = res ?? [];
                    if (callback) callback();
                }));
        }

        // TODO: apply filter request param later in here
        function createGetWorkflowDataRequest() {
            // If every item of the list is checked, make it empty and pass 0 to stored procedure. It won't insert all element into the table (increase performance)
            var listIdProject = listProject.every(element => element.Check === true) ? [] : listProject.filter((element) => element.Check === true).map((element) => ({Id: element.Id}));
            var listIdWorkflowTemplate = listWorkflowTemplateFilter.every(element => element.Check === true) ? [] : listWorkflowTemplateFilter.filter((element) => element.Check === true).map((element) => ({Id: element.Id}));
            var listIdTaxReturnType = listTaxReturnType.every(element => element.Check === true) ? [] : listTaxReturnType.filter((element) => element.Check === true).map((element) => ({Id: element.Id}));
            var listIdDifficulty = listDifficulty.every(element => element.Check === true) ? [] : listDifficulty.filter((element) => element.Check === true).map((element) => ({Id: element.Id}));
            var optionPriority = getPriorityDefaultValue();
            var listWorkflowStatus = getWorkflowStatus();
            var listWorkStepStatus = getWsStatusRequest();
            var listIdPriority = optionPriority.every(element => element.Check === true) ? [] : optionPriority.filter((element) => element.Check === true).map((element) => ({Id: element.Id}));
            var listIdWorkflowStatus = listWorkflowStatus.every(element => element.Check === true) ? [] : listWorkflowStatus.filter((element) => element.Check === true).map((element) => ({Id: element.Id}));
            var listIdWorkstepStatus = listWorkStepStatus.every(element => element.Check === true) ? [] : listWorkStepStatus.filter((element) => element.Check === true).map((element) => ({Id: element.Id}));

            return {
                listProject: JSON.stringify(listIdProject),
                listWorkflowTemplate: JSON.stringify(listIdWorkflowTemplate),
                listTaxReturnType: JSON.stringify(listIdTaxReturnType),
                dueDate: JSON.stringify({
                    StartDate: dueDateOptions.StartDate,
                    EndDate: dueDateOptions.EndDate
                }),
                difficulty: JSON.stringify(listIdDifficulty),
                priority: JSON.stringify(listIdPriority),
                targetDate: JSON.stringify(targetDateOptions),
                workflowStatus: JSON.stringify(listIdWorkflowStatus), // no need
                workstepDescription: $("#searchWorkStepInput")?.val() ?? "", // TODO: get id of input in UI
                workstepStatus: JSON.stringify(listIdWorkstepStatus),
                teamAssigned: listTeam.find(value => value.Check)?.Id.toString() || "",
                isUncheckAllPortfolio: false,//listPortfolio.every(value => value.Check === false),
                isUncheckAllProject: false,//listProject.every(value => value.Check === false),
                isUncheckAllTemplate: false//listWorkflowTemplateFilter.every(value => value.Check === false)
            }
        }

        function getListProject(callback) {
            ajaxPost("GetListProject", {},
                ajaxResultChecker((results) => {
                    listProject = results
                    listProject = listProject.map(value => {
                        value.Check = false;
                        return value;
                    });
                    generateListProjectFilter();

                    if (callback) callback();
                }
            ));
        }

        function generateListProjectFilter(searchString = "", data = listProject) {
            var prjFilterMenu = $('#projectFilterMenu');
            if (!prjFilterMenu || !prjFilterMenu?.length) return;

            prjFilterMenu.empty();
            prjFilterMenu.append(
                `<div>` +
                    `<input type="radio" name="project-name" style="margin-right: 10px" id="allProject" onClick="selectAllProject(this)">` +
                    `<label for="allProject" style="cursor: pointer;">All</label>` +
                "</div>"
            )

            data.forEach(value => {
                if (searchString == "" || value.Name.toLowerCase().includes(searchString.toLowerCase())) {
                    prjFilterMenu.append(
                        `<div style="display:flex">` +
                        `<input type="radio" name="project-name" style="margin-right: 10px" onClick="selectProjectOption(${value.Id})" id="project-${value.Id}" ${value.Check ? "checked" : ""}>` +
                        `<label for="project-${value.Id}" style="cursor: pointer; white-space: normal">${value.Name}</label>` +
                        "</div>"
                    );
                }
            });

            if (data.every(value => value.Check === true)) {
                $("#allProject").prop("checked", true);
            }
        }

        function selectProjectOption(id){
            listProject.find(value => {
                if (value.Id == id){
                    value.Check = !value.Check
                }
            });

            // TODO: render kanban board data
            
        }

        // on key up to search project by name
        function searchProject() {
            if (timer) clearTimeout(timer);

            timer = setTimeout(function() {
                var searchValue = $('#searchProjectInput').val();
                generateListProjectFilter(searchValue, listProject);
            }, 500);
        }

        function getWorkflowTemplateForFilter(callback) {
            ajaxPost("GetWorkflowTemplateForFilter", {},
                ajaxResultChecker((results) => {
                    listWorkflowTemplateFilter = results
                    listWorkflowTemplateFilter = listWorkflowTemplateFilter.map(value => {
                        value.Check = false;
                        return value;
                    });

                    if (callback) callback();
                }
            ));
        }

        function getListDifficulty(callback) {
            ajaxPost("GetListOfDifficulty", {},
                ajaxResultChecker((results) => {
                    listDifficulty = results
                    listDifficulty = listDifficulty.map(value => {
                        value.Check = true;
                        return value;
                    });
                    
                    if (callback) callback();
                }
            ));
        }

        function getTaxReturnTypeForFilter(callback) {
            ajaxPost("GetTaxReturnTypeForFilter", {},
                ajaxResultChecker((results) => {
                    if (results?.length){
                        listTaxReturnType = results;
                        listTaxReturnType = listTaxReturnType.map(value => {
                            value.Check = false;
                            return value;
                        });
                    }

                    if (callback) callback();
                }
            ));
        }

        function getPriorityDefaultValue() {
            return [
                { Name: "High", Id: 1, Check : true },
                { Name: "Medium", Id: 2, Check : true },
                { Name: "Low", Id: 3, Check : true }
            ];
        }

        function getWorkflowStatus() {
            return [
                { Name: "Canceled", Id: 8, Check : true },
                { Name: "Suspended", Id: 22, Check : true },
                { Name: "Pending", Id: 24, Check : true },
                { Name: "Active", Id: 1, Check : true },
                { Name: "Completed", Id: 23, Check : true },
            ];
        }

        function getWsStatusRequest() {
            return statuses.map(item => {
                return {
                    Name: item.name,
                    Id: item.id,
                    Check: item.checked
                };
            });
        }

        function getListPortfolio(callback) {
            ajaxPost("GetListPortfolio", {},
                ajaxResultChecker((results) => 
                {
                    listPortfolio = results
                    listPortfolio = listPortfolio.map(value => {
                        value.Check = !portfolioSaved.length ? false : !!portfolioSaved.find(portfolio => portfolio.Id == value.Id);
                        return value;
                    });
                    
                    if (callback) callback();
                }
            ));
        }
        function updateStatus(targetStatus, isChecked, callback) {
            if (targetStatus === statusIds.All) {
                // should always checked all options when click "All" option
                isChecked = true;
                $("#statusMenuContainer input[type=checkbox]").prop("checked", isChecked);
                statuses.forEach(item => item.checked = isChecked);
            } else {
                var targetStatusIndex = statuses.findIndex(status => status.id === targetStatus);
                if (targetStatusIndex >= 0) statuses[targetStatusIndex].checked = isChecked;

                var allChecked = statuses.every(status => status.checked);
                $('#all').prop('checked', allChecked);
            }

            if (callback) callback();
        }

        function setCheckboxStatuses(data = statuses) {
            if (data.length === 0) return;

            var checkedStatusLength = 0;
            data.forEach(status => {
                if (status.checked) ++checkedStatusLength;

                $('#' + status.name.toLowerCase()).prop('checked', status.checked);
            });

            if (checkedStatusLength === data.length) $("#all").prop("checked", true);
        }

        function setToggleSwimlanesMode() {
            //isSwimlane = true;
            if (isSwimlane) {
                $('#swimlanes-toggle').prop('checked', true);
            }
        }

        function onChangeStatusInput(event) {
            var checkboxId = event.target.id ?? "";
            var isChecked = event.target.checked;
            if (checkboxId.length) {
                checkboxId = checkboxId.charAt(0).toUpperCase() + checkboxId.slice(1);
            }

            updateStatus(statusIds[checkboxId], isChecked, () => {
                saveStatusSetup(statuses);
                var statusCheckboxes = $("#statusMenuContainer input[type=checkbox]");
                statusCheckboxes.prop("disabled", true);
                getWorkflowData(() => {
                    statusCheckboxes.prop("disabled", false);
                    renderKanbanBoard(kanbanColumns, true);
                });
            });
        }

        function onSelectProjectSearchDropdown() {
            // should reset active option when open dropdown
            $("#projectSearchMenu").children("button").removeClass("button--active");
            // should hide children popups (if opening)
            $(".project-filter-dropdown").hide();
        }

        function showListProjectOption() {
            toggleFilterProjectDropdown(false, true);
            toggleFilterPortfolioDropdown(false);
        }

        function showListPortfolioOption() {
            toggleFilterPortfolioDropdown (false, true);
            toggleFilterProjectDropdown(false);
        }

        function toggleFilterProjectDropdown(isShow = true, isClick = false) {
            var dropdown = $("#projectFilterDropdown");
            if (!dropdown || !dropdown?.length) return;

            if (isClick) {
                dropdown.toggle();
                $(".project-filter-button").removeClass("button--active");
                $("#projFilterBtn").toggleClass("button--active");
                return;
            }

            dropdown.toggle(isShow);
        }

        function toggleFilterPortfolioDropdown(isShow = true, isClick = false) {
            var dropdown = $("#portfolioFilterDropdown");
            if (!dropdown || !dropdown?.length) return;

            if (isClick) {
                dropdown.toggle();
                $(".project-filter-button").removeClass("button--active");
                $("#portfolioFilterBtn").toggleClass("button--active");
                return;
            }

            dropdown.toggle(isShow);
        }
    </script>
</head>
<body onload="Javascript:pageLoad();">
    <form runat="server"></form>

    <div class="Activities-page">
       
        <div class="dashboard">
            <div class="dashboard-header">
                <h2 style="color:#4A4A4A; font-weight: bold;">Activities</h2>
                <button style="background-color: white; border:none; width: 40px;height: 40px;">
                    <i class="fas fa-th"></i>
                </button>
            </div>
            <div class="dashboard-controls">
                <div class="dashboard-controls-left">
                    <div class="icon-group" style="height: 35px;">
                        <button onclick="onSelectViewMode(0)"><i class="fas fa-bars" style="width: 15px; height: 15px;"></i></button>
                        <button onclick="onSelectViewMode(1)"><img src="./images/detail-view-icon.png" alt="kanban-board-icon" style="width: 15px; height: 15px;"/></button>
                        <button class="btn--active"><img src="./images/kanban-view-icon.png" alt="kanban-board-icon" style="width: 15px; height: 15px;"/></button>
                    </div>
                    <div class="btn-group" style="height: 35px; border: 1px;">
                        <button type="button" class="btn btn-light"
                            style="font-weight: bold; margin-right: 0px; font-size: 13px">
                            Display
                        </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-light dropdown-toggle" id="dropdownMenuButton"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 13px; padding: 0px">
                                Work Steps
                                        <i class="fas fa-chevron-down" style="margin-left: 12px; margin-right: 5px"></i>
                            </button>
                            <ul class=" dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <li>
                                    <a class="dropdown-item" href="#">Work Steps</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">Status</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <!-- filter by project and portfolio -->
                    <div class="dropdown project-search-dropdown" id="projectSearchDropdown">
                        <button class="btn btn-light dropdown-toggle" type="button" id="projectSearchMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="onSelectProjectSearchDropdown()">
                            Project Search <span class="caret"></span>
                        </button>
                        <div id="projectFilterContainer" class="dropdown-menu" aria-labelledby="projectSearchMenuButton">
                            <div id="projectSearchMenu" style="padding: 0px !important;">
                                <button id="projFilterBtn" class="project-filter-button" onclick="showListProjectOption()">
                                    <span>Project</span>
                                    <i class='fas fa-angle-right'></i>
                                </button>
            
                                <button id="portfolioFilterBtn" class="project-filter-button" onclick="showListPortfolioOption()">
                                    <span>Portfolio of Projects</span>
                                    <i class='fas fa-angle-right'></i>
                                </button>
                            </div>
                            
                            <!-- project menu -->
                            <div class="dropdown-menu project-filter-dropdown" style="padding: 0; overflow: hidden" id="projectFilterDropdown">
                                <div class="search-project" style="padding: 10px 0px;">
                                    <input class="search-input" style="margin: 0px 10px; width: 90%;" id="searchProjectInput" placeholder="Search..." onkeyup="searchProject()"></input>
                                </div>
                                <div class="project-filter-menu" id="projectFilterMenu"></div>
                            </div>
        
                            <!-- Portfolio menu -->
                            <div class="dropdown-menu portfolio-filter-dropdown" style="padding: 0; overflow: hidden" id="portfolioFilterDropdown">
                                <div class="search-portfolio" style="padding: 10px 0px;">
                                    <input class="search-input" style="margin: 0px 10px; width: 90%;" id="searchPortfolioInput" placeholder="Search..." onkeyup="searchPortfolio()"></input>
                                </div>
        
                                <div style="display: flex; align-items: center; padding: 0px 10px 10px 10px;">
                                    <input type="checkbox" style="margin-right: 5px"  id="showOnlySelectedPortfolios" onchange="showOnlySelectedPortfolios(this)">
                                    <label for="showOnlySelectedPortfolios" style="cursor: pointer; margin-bottom: 0px !important;">Show only selected portfolios</label>
                                </div>
        
                                <div class="portfolio-filter-menu" id="portfolioFilterMenu"></div>
                            </div>
                        </div>
                        
                        <div class="left-border"></div>
                    </div>

                    <!-- filter by work step status -->
                    <div class="btn-group" style="height: 35px; border: 1px;">
                        <button type="button" class="btn btn-light" style="font-size: 13px; margin-right: 0px; font-weight: bold">Statuses </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-light dropdown-toggle" id="dropdownStatusBtn"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 14px; padding: 0px">
                                All
                                <i class="fas fa-chevron-down " style="margin-left: 18px; margin-right: 5px"></i>
                            </button>
                            <div class="dropdown-menu" id="statusMenuContainer" aria-labelledby="dropdownStatusBtn">
                                <label class="menu-item">
                                    <input type="checkbox" value="" id="all" onchange="onChangeStatusInput(event)">
                                    <span>All</span>
                                </label>
                                <label class="menu-item">
                                    <input type="checkbox" value="true" id="pending" onchange="onChangeStatusInput(event)">
                                    <span>Pending</span>
                                </label>
                                <label class="menu-item">
                                    <input type="checkbox" value="" id="active" onchange="onChangeStatusInput(event)">
                                    <span>Active</span>
                                </label>
                                <label class="menu-item">
                                    <input type="checkbox" value="" id="completed" onchange="onChangeStatusInput(event)">
                                    <span>Completed</span>
                                </label>
                                <label class="menu-item">
                                    <input type="checkbox" value="" id="cancelled" onchange="onChangeStatusInput(event)">
                                    <span>Cancelled</span>
                                </label>
                                <label class="menu-item">
                                    <input type="checkbox" value="" id="suspended" onchange="onChangeStatusInput(event)">
                                    <span>Suspended</span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="icon-group card-setup-btn" style="margin-left: 10px; height: 35px; border: 1px;">
                        <button onclick="onClickCardSetupBtn()"><i class="far fa-calendar-minus"></i></button>
                        <div id="cardSetup" class="card-setup-container">
                            <div class="card-setup-container__inner">
                                <h1>Card Setup</h1>

                                <div class="inner__custom-client-project">
                                    <span>Client\Project Description - Custom</span>
                                    <img id="settingIcon" src="./images/settings-icon.png" alt="settings-icon" onclick="onClickCustomFieldNameSetting()" />
                                </div>

                                <div id="customModal" class="custom-modal">
                                    <h3>Client\Project Description - Custom</h3>

                                    <div class="custom-modal__body">
                                        <div id="customCheckboxContainer" class="body__custom-container"></div>
                                        <input id="customInput" class="body__custom-input" type="text" onkeyup="onKeyupFormatNameString(event)" />
                                        <p>You can use the check boxes or type directly for special formatting</p>
                                        <p>Default format "Client Long Name\Project Description (Project Code)"</p>
                                    </div>

                                    <div class="custom-modal__footer">
                                        <button class="footer__apply-btn" onclick="applyFormatName()">Apply</button>
                                        <button class="footer__close-btn" onclick="onCloseCustomModal()">Close</button>
                                    </div>
                                </div>

                                <div id="fieldSelection" class="inner__field-selection"></div>

                                <div class="inner__footer">
                                    <button class="footer__btn-cancel" onclick="toggleCardSetupModal()">Cancel</button>
                                    <button class="footer__btn-apply" onclick="onClickApplyCardSetup()">Apply</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="dashboard-controls-right">
                    <div class="switch"></div>
                    <label for="swimlanes-toggle" style="font-weight: bold;">Swimlanes Mode:</label>
                    <label class="switch">
                        <input type="checkbox" id="swimlanes-toggle" />
                        <span class="slider"></span>
                    </label>
                </div>
            </div>
            <div id="root" style="height: calc(100% - 56px);"></div>
        </div>
    </div>
      
</body>
</html>