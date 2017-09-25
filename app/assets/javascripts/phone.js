function clearFields(selectors) {
    selectors.forEach(function (t) {
        $(t).val("")
    });
}

$(function () {

        $('#person_field').autocomplete({
            minLength: 2,
            source: '/people/search',
            search: function () {
                $('#telephone_person_id').val("");
                return true;
            },
            focus: function (event, ui) {
                $('#person_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#person_field').val(ui.item.name);
                $('#telephone_person_id').val(ui.item.id);
                return false;
            }
        }).data("uiAutocomplete")._renderItem = function (ul, item) {
            return $("<li>").data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
        };

        $('#office_field').autocomplete({
            minLength: 2,
            source: '/divisions/search',
            search: function () {
                $('#telephone_office_id').val("");
                return true;
            },
            focus: function (event, ui) {
                $('#office_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#office_field').val(ui.item.name);
                $('#telephone_office_id').val(ui.item.id);
                return false;
            }
        }).data("uiAutocomplete")._renderItem = function (ul, item) {
            return $("<li>").data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
        };

        $('#dept_field').autocomplete({
            minLength: 2,
            source: function (request, response) {
                var office_id = $('#telephone_office_id').val()
                $.getJSON("/divisions/" + office_id + "/search", {term: request.term}, response);
            },
            search: function () {
                $('#telephone_dept_id').val("");
                $('#office_field').prop('disabled', false);
                return true;
            },
            focus: function (event, ui) {
                $('#dept_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#dept_field').val(ui.item.name);
                $('#telephone_dept_id').val(ui.item.id);
                $('#office_field').prop('disabled', true);
                return false;
            }
        }).data("uiAutocomplete")._renderItem = function (ul, item) {
            return $("<li>").data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
        };

        $('#sector_field').autocomplete({
            minLength: 2,
            source: function (request, response) {
                var dept_id = $('#telephone_dept_id').val()
                $.getJSON("/divisions/" + dept_id + "/search", {term: request.term}, response);
            },
            search: function () {
                $('#telephone_sector_id').val("");
                $('#dept_field').prop('disabled', false);
                return true;
            },
            focus: function (event, ui) {
                $('#sector_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#sector_field').val(ui.item.name);
                $('#telephone_sector_id').val(ui.item.id);
                $('#dept_field').prop('disabled', true);
                return false;
            }
        }).data("uiAutocomplete")._renderItem = function (ul, item) {
            return $("<li>").data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
        };
    }
);

$(document).ready(function () {
    $('.phone-masked').mask('(00) 0000 0000');
    $('.branch-masked').mask('0000');
});
