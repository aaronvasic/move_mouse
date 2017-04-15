module XScreenTool
    module CommandLine
        module Command

            Kde = {
                config: [ "file\nwhere file is the name or path of the kconfig file to write",
                    ->(*args){
                        raise ::XScreenTool::InvalidArgumentException if args[0].nil?
                        KDE::Config.new(args[0]).write(Displays)
                    } ],
                shortcuts: {
                    register: [ "\n(no args)\n(this function is broken)",
                    ->(*args){
                        KDE::Shortcuts.register(Displays)
                    } ]
                }
            }
        end
    end
end
