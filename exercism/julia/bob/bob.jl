function bob(stimulus)
    # 1) Checar si la cadena esta vacia
    # 2) Checar si la cadena tiene un signo de interrogacion (?)
    # 3) Checar si la cadena es toda en mayusculas
    # 4) Cualquier otra cosa regresa "Whatever."
    nospace = strip(stimulus)
    if isempty(nospace)
        return "Fine. Be that way!"
    elseif uppercase(stimulus) == stimulus
        if endswith(stimulus, "?")
            return "Calm down, I know what I'm doing!"
        else
            return "Whoa, chill out!"
        end
    else
        if endswith(stimulus, "?")
            return "Sure."
        end
    end
    return "Whatever."
end
