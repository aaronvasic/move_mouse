module XScreenTool
    module CommandLine
        module Command
            Install = {
                commands: [ "\n(no args)\n\nInstalls commands based on configuration to ~/.local/bin",
                    ->(*args){
                        fname=INSTALLPATH
                        File.open(fname,"w+") do |io|
                            io.puts "#!/bin/bash"

                            io.puts "case $1 in"

                                io.puts '( "screen" )'
                                    io.puts "case $2 in"
                                        Displays.each.with_index{|display,idx|
                                            io.puts "('#{idx}') #{Mouse.xdotool(display.center)} ;;"
                                            io.puts "('#{display.identifier}') #{Mouse.xdotool(display.center)} ;;"
                                        }
                                    io.puts "esac"
                                io.puts ";;"

                                io.puts '( "mouse" )'
                                    io.puts "case $2 in"
                                        io.puts ' ("centertowindow") '
                                            io.puts Mouse.xdotool_centerToWindow
                                        io.puts ";;"
                                    io.puts "esac"
                                io.puts ";;"

                                io.puts '( "window" )'
                                    io.puts "case $2 in"
                                        io.puts ' ("move") '
                                            io.puts "case $3 in"
                                                io.puts ' ("screen") '
                                                        io.puts "case $4 in"
                                                            Displays.each.with_index{|display,idx|
                                                                io.puts "('#{display.identifier}')"
                                                                    io.puts Window.xdotool_moveToScreen(display.identifier)
                                                                io.puts ";;"
                                                            }
                                                        io.puts "esac"
                                                io.puts ";;"
                                            io.puts "esac"
                                        io.puts ";;"
                                    io.puts "esac"
                                io.puts ";;"
                            io.puts "esac"
                        end
                        File.chmod(0700,fname)
                    } ]
            }
        end
    end
end
