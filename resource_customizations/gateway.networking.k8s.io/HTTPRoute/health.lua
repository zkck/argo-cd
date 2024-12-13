local health_status={}
health_status.status = "Healthy"
if obj.status ~= nil then
    if obj.status.parents ~= nil then
        for _, parent in ipairs(obj.status.parents) do
            if parent ~= nil and parent.conditions ~= nil then
                for _, condition in ipairs(parent.conditions) do
                    if (condition.type == "ResolvedRefs" or condition.type == "Accepted") and condition.status == "False" then
                        health_status.status = "Degraded"
                    end
                end
            end
        end
    end
end
return health_status
