function filter_activities(filter, sort)
{
    window.location = window.location.href.split('?')[0] + "?filter=" + filter +"&sort=" + sort;
}