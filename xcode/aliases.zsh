alias ox="open -a 'Xcode' ."
alias oxb="open -a 'Xcode-beta' ."
alias sx="sudo xcode-select -s /Applications/Xcode.app"
alias sxb="sudo xcode-select -s /Applications/Xcode-beta.app"
alias ded="rm -rf ~/Library/Developer/Xcode/DerivedData/*"
alias simreset="killall Xcode && sudo killall -9 com.apple.CoreSimulator.CoreSimulatorService && rm -rf ~/Library/Developer/CoreSimulator/Devices"
alias cbs="carthage bootstrap --use-submodules --no-build --use-ssh"
alias cb="carthage bootstrap --no-build --use-ssh"
alias cus="carthage update --use-submodules --no-build --use-ssh"
alias cu="carthage update --no-build --use-ssh"
