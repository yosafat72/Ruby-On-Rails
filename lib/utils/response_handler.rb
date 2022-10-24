module ResponseHandler
    class Response
        def ResponseJson(values, message)
            json = {
                values: values,
                message: message,
            }
            return json
        end
    end
end