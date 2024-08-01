<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkflowKanbanBoard.aspx.cs" Inherits="KanbanBoard.WorkflowKanbanBoard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="../dhtmlx/dhtmlxKanban/dist/kanban.js"></script>
    <link rel="stylesheet" href="../dhtmlx/dhtmlxKanban/dist/kanban.css"/>
    <script src="https://snippet.dhtmlx.com/codebase/data/kanban/01/dataset.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type="text/javascript"></script>
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
        }
        
        .icon-group > button {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 5px 10px;
            border: none;
            background-color: transparent;
            cursor: pointer;
            height: 100%;
        }

        .icon-group > button:hover {
            background-color: #f0f0f0;
        }

        .icon-group > button:focus {
            outline: none;
        }

        .icon-group .active {
            background-color: black;
        }
    
        .btn-group{
            margin-left:15px;
            font-size:14px !important;
        }

        .dashboard {
            height: 100vh;
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

        .dropdown-menu {
            background-color: white; 
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
            width: 45%;
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

        .value {
            flex: 1;
            word-break: break-word;
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            font-weight: bold;
        }

        .date-value{
            margin-right: 10px;
        }

        .section .value {
            font-weight: bold;
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

        .form-check{
            display:flex;
        }

        .form-check-input{
            margin-left: 0.1px;
            margin-top:0.7rem;
        }

        .dropdown-toggle::after {
            display: none;
        }
        .wx-label.svelte-ms9wpd.svelte-ms9wpd{
            font-weight:800;
        }
        .dashboard-controls-right{
            margin-top:5px;
        }
    </style>
    <script>
        const { Kanban, template } = kanban;

        const users = [
            { id: 1, label: "Steve Smith", avatar: "https://snippet.dhtmlx.com/codebase/data/kanban/01/img/user-1.jpg" },
            { id: 2, label: "Aaron Long", avatar: "https://snippet.dhtmlx.com/codebase/data/kanban/01/img/user-2.jpg" },
            { id: 3, label: "Angela Allen", avatar: "https://snippet.dhtmlx.com/codebase/data/kanban/01/img/user-3.jpg" },
            { id: 4, label: "Angela Long", avatar: "https://snippet.dhtmlx.com/codebase/data/kanban/01/img/user-4.jpg" },
        ];

        const cardShape = {
            label: true,
            description: true,
            progress: true,
            start_date: true,
            end_date: true,
            users: {
                show: true,
                values: users,
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

        const defaultColumns = [
            { label: "Engagement letter created and mailed", id: "backlog" },
            { label: "Engagement letter signed", id: "inprogress" },
            { label: "Information received", id: "testing" },
            { label: "Intake", id: "done" },
            { label: "Document review", id: "Document review" },
            { label: "Preparation", id: "Preparation" },
        ];

        const rows = [
            { label: "Feature", id: "feature" },
            { label: "Task", id: "task" },
        ];

        const description = "1020 Income Tax Return/Simple";
        const cards = [
            {
                id: 1,
                label: "", // 13 Handles - Cash Management Study 2024 (249398)
                priority: 1,
                color: "#65D3B3",
                start_date: new Date("01/07/2021"),
                users: [3, 2],
                column: "backlog",
                type: "feature",
                comments: [],
                data: {
                    ClientLongName: "Hunter",
                    ClientShortName: "Nghiem",
                    ClientCode: "S001",
                    ProjectDescription: "WSG",
                    ProjectCode: "WSG-001",
                    Description: "1020 Income Tax Return/ Simple",
                    Priority: "Medium",
                    DueDate: "01/07/2021",
                    TargetDate: "02/07/2021",
                    TemplateDescription: "Income Tax return",
                    TaxType: "Tax type",
                    Difficulty: "Difficulty",
                    Industry: "Industry",
                    ForeignConsent: "No",
                    Status: "Completed",
                    AssignedTo: "",
                    ProductivityRate: "",
                    ScheduledStartDate: "01/01/2024",
                    ScheduledEndDate: "30/01/2024",
                    ScheduledHoursStandard: "",
                    ScheduledHoursAssigned: "",
                    ActualStartDate: "02/01/2024",
                    ActualEndDate: "25/01/2024"
                }
            },
            {
                id: 2,
                label: "", // 14 Handles - Cash Management Study 2024 (249398)
                priority: 2,
                color: "#FFC975",
                start_date: new Date("01/07/2021"),
                users: [3, 2],
                column: "inprogress",
                type: "feature",
                comments: [],
                data: {
                    ClientLongName: "Nick",
                    ClientShortName: "Ta",
                    ClientCode: "J002",
                    ProjectDescription: "WSG",
                    ProjectCode: "WSG-001",
                    Description: "1020 Income Tax Return/ Simple",
                    Priority: "Medium",
                    DueDate: "01/07/2021",
                    TargetDate: "02/07/2021",
                    TemplateDescription: "Income Tax return",
                    TaxType: "Tax type",
                    Difficulty: "Difficulty",
                    Industry: "Industry",
                    ForeignConsent: "No",
                    Status: "Completed",
                    AssignedTo: "",
                    ProductivityRate: "",
                    ScheduledStartDate: "01/01/2024",
                    ScheduledEndDate: "30/01/2024",
                    ScheduledHoursStandard: "",
                    ScheduledHoursAssigned: "",
                    ActualStartDate: "02/01/2024",
                    ActualEndDate: "25/01/2024"
                }
            },
            {
                id: 3,
                label: "", // 15 Handles - Cash Management Study 2024 (249398)
                priority: 3,
                color: "#FF5252",
                start_date: new Date("01/07/2021"),
                users: [3, 2],
                column: "testing",
                type: "feature",
                comments: [],
                data: {
                    ClientLongName: "Koala",
                    ClientShortName: "Huynh",
                    ClientCode: "D003",
                    ProjectDescription: "WSG",
                    ProjectCode: "WSG-001",
                    Description: "1020 Income Tax Return/ Simple",
                    Priority: "Medium",
                    DueDate: "01/07/2021",
                    TargetDate: "02/07/2021",
                    TemplateDescription: "Income Tax return",
                    TaxType: "Tax type",
                    Difficulty: "Difficulty",
                    Industry: "Industry",
                    ForeignConsent: "No",
                    Status: "Completed",
                    AssignedTo: "",
                    ProductivityRate: "",
                    ScheduledStartDate: "01/01/2024",
                    ScheduledEndDate: "30/01/2024",
                    ScheduledHoursStandard: "",
                    ScheduledHoursAssigned: "",
                    ActualStartDate: "02/01/2024",
                    ActualEndDate: "25/01/2024"
                }
            },
            {
                id: 4,
                label: "", // 16 Handles - Cash Management Study 2024 (249398)
                priority: 1,
                color: "#65D3B3",
                start_date: new Date("01/07/2021"),
                users: [3, 2],
                column: "done",
                type: "feature",
                comments: [],
                data: {
                    ClientLongName: "Saka",
                    ClientShortName: "Tran",
                    ClientCode: "S004",
                    ProjectDescription: "WSG",
                    ProjectCode: "WSG-001",
                    Description: "1020 Income Tax Return/ Simple",
                    Priority: "Medium",
                    DueDate: "01/07/2021",
                    TargetDate: "02/07/2021",
                    TemplateDescription: "Income Tax return",
                    TaxType: "Tax type",
                    Difficulty: "Difficulty",
                    Industry: "Industry",
                    ForeignConsent: "No",
                    Status: "Completed",
                    AssignedTo: "",
                    ProductivityRate: "",
                    ScheduledStartDate: "01/01/2024",
                    ScheduledEndDate: "30/01/2024",
                    ScheduledHoursStandard: "",
                    ScheduledHoursAssigned: "",
                    ActualStartDate: "02/01/2024",
                    ActualEndDate: "25/01/2024"
                }
            },
        ];

        var formatNameObj = {};
        var statuses = [];
        var isSwimlane = false;

        var statusIds = {
            Active: 0,
            Complete: 1,
            Pending: 2,
            Canceled: 8,
            Suspended: 22
        }

        // card setup data
        var fieldSelections = [];

        // variable to show Kanban view
        var kanbanBoard;
        var kanbanColumns = [];

        var workflowId = getParamValue("workflowId") ?? 0;

        function pageLoad() {
            loadData();
        }

        function renderKanbanBoard(columns = kanbanColumns, isUpdatedBoard = false) {
            // destructor() is remove all Kanban board config in UI
            //if (isUpdatedBoard) kanbanBoard.destructor();
            console.log("isrender");
            console.log(columns);
            kanbanBoard = new Kanban("#root", {
                columns,
                cards,
                cardTemplate: template(card => cardTemplate(card)),
                cardShape,
                readonly: {
                    edit: true, 
                    add: false, 
                    select: true, 
                    dnd: true 
                }
            });

            kanbanBoard.api.on("move-column", (obj) => {
                var columnOrder = JSON.stringify(kanbanBoard.api.getState().columns);
                console.log(columnOrder);
                ajaxPost("SaveColumnOrder", { columnOrder, workflowId}, ajaxResultChecker(() => {}));
            });
        }

        function escapeHTML(str) {
            return str.replace(/[&<>'"]/g, tag => ({
                "&": "&amp;",
                "<": "&lt;",
                ">": "&gt;",
                "'": "&#39;",
                "\"": "&quot;"
            }[tag] || tag));
        }

        function cardTemplate({ cardFields, selected }) {
            const { label, color } = cardFields;

            const userAvatars = cardFields.users.map(userId => {
                const user = users.find(user => user.id === userId);
                return `<img src="${user.avatar}" title="${user.label}" class="avatar">`;
            }).join('');

            const userInfos = cardFields.users.map(userId => {
                const user = users.find(user => user.id === userId);
                return `
             <div class="user-info">
              <img src="${user.avatar}" title="${user.label}" class="avatar">
                 <span>${user.label}</span>
                
             </div>`;
            }).join('');

            // apply formatNameObj to card label
            var cardLabel = formatNameObj.formatString;
            formatNameObj.nameFormat.forEach(item => {
                if (item.checked) {
                    var value = cardFields.data[item.field];
                    cardLabel = cardLabel.replace(item.order, value);
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

        // TODO: load init data
        function loadData() {
            ajaxPost("GetColumnOrder", workflowId, ajaxResultChecker((result) => {
                kanbanColumns = result ? JSON.parse(result) : defaultColumns;
                getViewSetup(() => {
                    generateCardSetup(fieldSelections, () => renderKanbanBoard());
                    generateClientProjDescCustom();
                });
            }));
        }
        
        // render card setup item modal
        function generateCardSetup(data = fieldSelections, callback) {
            Promise.all([
                createNestedSortablesDefault(data, $("#fieldSelection"))
            ]).then(() => {
                // TODO: checked or indeterminate follow fieldSelections
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
                if (result) {
                    // Implement here when save status setup successfully
                }
                else {
                    alert("Can't save status");
                }
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
                    if (statuses.length === 0) {
                        statuses = createDefaultStatus();
                    }
                    isSwimlane = result.SwimlaneMode;
                    setCheckboxStatuses();
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

        function createDefaultFormat() {
            var nameFormat = [
                {
                    "headerName": "Client Long Name",
                    "field": "ClientLongName",
                    "checked": true,
                    "order": 1
                },
                {
                    "headerName": "Client Short Name",
                    "field": "ClientShortName",
                    "checked": false,
                    "order": 2
                },
                {
                    "headerName": "Client Code",
                    "field": "ClientCode",
                    "checked": false,
                    "order": 3
                }, 
                {
                    "headerName": "Project Description",
                    "field": "ProjectDescription",
                    "checked": true,
                    "order": 4
                },
                {
                    "headerName": "Project Code",
                    "field": "ProjectCode",
                    "checked": true,
                    "order": 5
                }
            ]
            var formatString = "1\\4 (5)";

            return { nameFormat: nameFormat, formatString: formatString };
        }

        function createDefaultStatus() {
            return [
                {
                    "name": "Active",
                    "id": statusIds.Active,
                    "checked": true,
                },
                {
                    "name": "Completed",
                    "id": statusIds.Complete,
                    "checked": true,
                },
                {
                    "name": "Pending",
                    "id": statusIds.Pending,
                    "checked": true,
                },
                {
                    "name": "Cancelled",
                    "id": statusIds.Canceled,
                    "checked": true,
                },
                {
                    "name": "Suspended",
                    "id": statusIds.Suspended,
                    "checked": true,
                },
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

        /// <summary>
        /// Get the desired parameter value from parameters passed to page.
        /// </summary>
        /// <returns></returns>
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

        function onChangeCustomInput(arr = formatNameObj.nameFormat) {
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
                element.checked = false
                $(`.custom-container__line input[name=${element?.field}]`).prop("checked", false);
            });
        
            var notSelectedItem = [...arr]

            for (var index = 0; index < sortedArray.length; index++) {
                var selection = arr.find(value => value.order.toString() === sortedArray[index][0]);
                notSelectedItem = notSelectedItem.filter(value => value.order.toString() !== sortedArray[index].toString());

                if (selection) {
                    $(`.custom-container__line input[id=${selection?.field}]`).prop("checked", true);
                    selection.checked = true;
                }
            }

            notSelectedItem.forEach(value=> {
                $(`.sortable-item input[name=${value?.field}]`).prop("checked", false);
            })
        }
        function updateStatus(statusName, isChecked) {
            for (var i = 0; i < statuses.length; i++) {
                if (statuses[i].id === statusIds[statusName]) {
                    statuses[i].checked = isChecked;
                }
            }
            var allChecked = statuses.every(status => status.checked);
            $('#all-statuses').prop('checked', allChecked);
        }

        function setCheckboxStatuses() {

            if (statuses.length === 0) {
                statuses = createDefaultStatus();
            }
            statuses.forEach(status => {
                if (status.checked) {
                    $('#' + status.name.toLowerCase() + '-status').prop('checked', true);
                }
            });
        }

        function setToggleSwimlanesMode() {
            //isSwimlane = true;
            if (isSwimlane) {
                $('#swimlanes-toggle').prop('checked', true);
            }
        }

        $(document).ready(function () {
            $("#Workstepcheckbox").click(function () {
                $("#Workstepcheckbox").prop("checked", true);
                alert("Checkbox checked");
            });

            $("#swimlanes-toggle").change(function () {
               var isChecked = $(this).prop("checked");
           });

           $(".form-check-input").change(function () {
               var checkboxId = $(this).attr("id");
               var isChecked = $(this).prop("checked");

           });

           $("#swimlanes-toggle").change(function () {
                isSwimlane = !isSwimlane;
                saveSwimlaneMode()
            });
            $(".form-check-input").change(function () {
                var checkboxId = $(this).attr("id");
                var isChecked = $(this).prop("checked");
                switch (checkboxId) {
                    case 'all-statuses':
                        $('#active-status').prop('checked', true);
                        $('#completed-status').prop('checked', true);
                        $('#pending-status').prop('checked', true);
                        $('#cancelled-status').prop('checked', true);
                        $('#suspended-status').prop('checked', true);

                        updateStatus('Active', isChecked);
                        updateStatus('Complete', isChecked);
                        updateStatus('Pending', isChecked);
                        updateStatus('Canceled', isChecked);
                        updateStatus('Suspended', isChecked);
                        break;
                    case 'pending-status':
                        updateStatus('Pending', isChecked);
                        break;
                    case 'active-status':
                        updateStatus('Active', isChecked);
                        break;
                    case 'completed-status':
                        updateStatus('Complete', isChecked);
                        break;
                    case 'cancelled-status':
                        updateStatus('Canceled', isChecked);

                        break;
                    case 'suspended-status':
                        updateStatus('Suspended', isChecked);
                        break;
                    case 'all-status':

                    default:
                        alert("undefined-status");
                        return;
                }
                saveStatusSetup(statuses); 
            });
        })
    </script>
</head>
<body onload="Javascript:pageLoad();">
    <form runat="server"></form>

    <div class="Activities-page">
       
        <div class="dashboard">
            <div class="dashboard-header">
                <h2 style="color: #4A4A4A; font-weight: bold;">Activities</h2>
                <button style="background-color: white; border: none; width: 40px; height: 40px;">
                    <i
                        class="fas fa-th"></i>
                </button>
            </div>
            <div class="dashboard-controls">
                <div class="dashboard-controls-left">
                    <div class="icon-group" style="height: 35px;">
                        <button><i class="fas fa-bars"></i></button>
                        <button><i class="fas fa-grip-horizontal"></i></button>
                        <button><i class="fas fa-align-right"></i></button>
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
                    <div class="btn-group" style="height: 35px; border: 1px;">
                        <button type="button" class="btn btn-light" style="font-size: 13px; margin-right: 0px; font-weight: bold">Statuses </button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-light dropdown-toggle" id="dropdownMenuButton1"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 14px; padding: 0px">
                                All
                                     <i class="fas fa-chevron-down " style="margin-left: 18px; margin-right: 5px"></i>
                            </button>
                            <ul class=" dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="all-statuses">
                                        <a class="dropdown-item" href="#">All</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="true" id="pending-status">
                                        <a class="dropdown-item" href="#">Pending</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="active-status">
                                        <a class="dropdown-item" href="#">Active</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="completed-status">
                                        <a class="dropdown-item" href="#">Completed</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="cancelled-status">
                                        <a class="dropdown-item" href="#">Cancelled</a>
                                    </div>
                                </li>
                                <li>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="suspended-status">
                                        <a class="dropdown-item" href="#">Suspended</a>
                                    </div>
                                </li>
                            </ul>
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