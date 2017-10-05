$(function () {
        $('#person_field').autocomplete({
            minLength: 2,
            source: '/people/search',
            search: function () {
                $('#phone_person_attributes_id').val("");
                return true;
            },
            focus: function (event, ui) {
                $('#person_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#person_field').val(ui.item.name);
                $('#phone_person_attributes_id').val(ui.item.id);
                return false;
            },
            messages: {
                noResults: '',
                results: function () {}
            },
        }).data("uiAutocomplete")._renderItem = function (ul, item) {
            return $("<li>").data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
        };

        $('#office_field').autocomplete({
            minLength: 2,
            source: '/divisions/search',
            search: function () {
                $('#phone_division_attributes_parent_division_attributes_parent_division_attributes_id').val("");
                return true;
            },
            focus: function (event, ui) {
                $('#office_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#office_field').val(ui.item.name);
                $('#phone_division_attributes_parent_division_attributes_parent_division_attributes_id').val(ui.item.id);
                return false;
            },
            messages: {
                noResults: '',
                results: function () {}
            },
        }).data("uiAutocomplete")._renderItem = function (ul, item) {
            return $("<li>").data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
        };

        $('#dept_field').autocomplete({
            minLength: 2,
            source: function (request, response) {
                var office_id = $('#phone_division_attributes_parent_division_attributes_parent_division_attributes_id').val();
                $.getJSON("/divisions/" + office_id + "/search", {term: request.term}, response);
            },
            search: function () {
                $('#phone_division_attributes_parent_division_attributes_id').val("");
                $('#office_field').prop('disabled', false);
                return true;
            },
            focus: function (event, ui) {
                $('#dept_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#dept_field').val(ui.item.name);
                $('#phone_division_attributes_parent_division_attributes_id').val(ui.item.id);
                $('#office_field').prop('disabled', true);
                return false;
            },
            messages: {
                noResults: '',
                results: function () {}
            },
        }).data("uiAutocomplete")._renderItem = function (ul, item) {
            return $("<li>").data("item.autocomplete", item)
                .append("<a>" + item.name + "</a>")
                .appendTo(ul);
        };

        $('#sector_field').autocomplete({
            minLength: 2,
            source: function (request, response) {
                var dept_id = $('#phone_division_attributes_parent_division_attributes_id').val()
                $.getJSON("/divisions/" + dept_id + "/search", {term: request.term}, response);
            },
            search: function () {
                $('#phone_division_attributes_id').val("");
                $('#dept_field').prop('disabled', false);
                return true;
            },
            focus: function (event, ui) {
                $('#sector_field').val(ui.item.name);
                return false;
            },
            select: function (event, ui) {
                $('#sector_field').val(ui.item.name);
                $('#phone_division_attributes_id').val(ui.item.id);
                $('#dept_field').prop('disabled', true);
                return false;
            },
            messages: {
                noResults: '',
                results: function () {}
            },
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
