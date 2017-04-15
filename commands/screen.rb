module XScreenTool
    module CommandLine
        module Command
            Screen = [ "screen_id\n(where screen_id is the screen's index number)",
                    ->(*args){
                        raise ::XScreenTool::InvalidArgumentException(*args) unless args.first.match(/^\d+$/)
                        Mouse.move_to_screen(args.first)
                    } ]
        end
    end
end
