module Cowsay

using TextWrap

struct Balloon
    thoughts::String
    left::String
    right::String
    upleft::String
    upright::String
    midleft::String
    midright::String
    downleft::String
    downright::String
end

struct CowFace
    eyes::String
    tongue::String
end

const DEFAULT_WRAPWIDTH = 30
const SAY_BALLOON = Balloon("\\", "<", ">", "/", "\\", "|", "|", "\\", "/")
const THINK_BALLOON = Balloon("o", "(", ")", "(", ")", "(", ")", "(", ")")
const DEFAULT_FACE = CowFace("oo", "  ")
const COW_TYPES = Dict{String,CowFace}(
    "default" => DEFAULT_FACE,
    "borg" => CowFace("==", "  "),
    "dead" => CowFace("xx", "U "),
    "greedy" => CowFace("\$\$", "  "),
    "paranoid" => CowFace("@@", "  "),
    "stoned" => CowFace("**", "U "),
    "tired" => CowFace("--", "  "),
    "wired" => CowFace("OO", "  "),
    "young" => CowFace("..", "  ")
    )

function cowsay(message::String=""; type::String="default", wrapwidth::Integer=DEFAULT_WRAPWIDTH)
    face = get(COW_TYPES, type, DEFAULT_FACE)

    the_cow = construct_cow(message, balloon=SAY_BALLOON, face=face, wrapwidth=wrapwidth)

    print(the_cow)
end

function cowthink(message::String=""; type::String="default", wrapwidth::Integer=DEFAULT_WRAPWIDTH)
    face = get(COW_TYPES, type, DEFAULT_FACE)

    the_cow = construct_cow(message, balloon=THINK_BALLOON, face=face, wrapwidth=wrapwidth)

    print(the_cow)
end

function construct_cow(message::String; balloon::Balloon=SAY_BALLOON, face::CowFace=DEFAULT_FACE, wrapwidth::Integer=DEFAULT_WRAPWIDTH)::String

    wrapped_message = wrap(message, width=wrapwidth)
    lines = split(wrapped_message, "\n")
    textwidths = map(x->textwidth(x), lines)
    max_line_length = maximum(textwidths, dims=1)[1]
    padded_lines = map(x->rpad_textwidth(x, max_line_length), lines)

    message_width = max_line_length + 2
    message_height = length(padded_lines)

    cow = " $(repeat("_", message_width)) \n"

    for (index, line) in enumerate(padded_lines)  
        if message_height == 1
            cow = cow * "$(balloon.left) $line $(balloon.right)\n"
        elseif index == 1
            cow = cow * "$(balloon.upleft) $line $(balloon.upright)\n"
        elseif index == message_height
            cow = cow * "$(balloon.downleft) $line $(balloon.downright)\n"
        else 
            cow = cow * "$(balloon.midleft) $line $(balloon.midright)\n"
        end
    end

    cow = cow * " $(repeat("-", message_width)) \n"

    cow = cow * """
        $(balloon.thoughts)   ^__^
         $(balloon.thoughts)  ($(face.eyes))\\_______
            (__)\\       )\\/\\
             $(face.tongue) ||----w |
                ||     ||
"""

    return cow
end

function rpad_textwidth(text::AbstractString, maxwidth::Integer, padding::String=" ")::String

    padded_text = text

    while textwidth(padded_text) < maxwidth
        padded_text = padded_text * padding
    end

    return padded_text
end

end # module
