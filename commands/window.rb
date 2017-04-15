module XScreenTool
    module CommandLine
        module Command

            Window = {
                move: {
                    screen: [
                        "screen_index|screen_identifier",
                        ->(*args){
                            Window.MoveToScreen(*args)
                        } ]
                },
                tile: {
                    north: [
                        '',
                        ->(){
                        } ],
                    south: [ '',
                        ->(){} ]
                }
            }
        end
    end
end
