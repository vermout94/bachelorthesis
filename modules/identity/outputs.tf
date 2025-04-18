output "department_group_ids" {
    value = {
        for key, group in azuread_group.department_groups :
        key => group.id
    }
}
