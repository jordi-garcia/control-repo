
# Used to make modifications to .ssh/authorized_keys 

class p9linux_initialconfig::authorized_keys  {

    file_line { 'Modify .ssh/authorized_keys':
        path    => '/root/.ssh/authorized_keys',
        line    => 'no-port-forwarding,no-agent-forwarding,no-X11-forwarding,command= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAsMvODgIqL1NoUgP65qmgf0sJjQy78QdA5rHw9tIwK5KstVSh+0w4TLHJq8Jz8E4UeXhx0NioP3kE3otjCC8kSM5y99QOs4qQh7q6cLN9hQpXMQUD9UnJMP0b5agd0PdErH0ML9hnWfsZX707v31VSIbco+X6Kg9wN8WJhlTXgbbrJTUIPnMzNXrN7Z5/jY6Vss7NTCVI7OxUbIna37l5y8s4jxViaXjoVEXP8e4QtTX8p0BYc2vgerI04ZilhbIe4KEcHiR+n/GUr6MmkY5qtLum/7IZLHbHfWha1q7VaPnz/CHmlDySxxq4sF81N4x2V7d0+x8/wNZx2d+duJmV0Q==',
        match    => '^no-port-forwarding',
    }
}
