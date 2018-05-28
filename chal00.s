.globl main
main:
movabs $0xc0601000b0d0e0f,%rax
cmp    $0x2,%edi
mov    %rax,-0x10(%rsp)
movabs $0x70903020a080504,%rax
mov    %rax,-0x8(%rsp)
mov    $0x1,%eax
jne    L2
mov    0x8(%rsi),%rdx
xor    %eax,%eax
L3:
mov    %eax,%ecx
inc    %rax
cmpb   $0x0,-0x1(%rdx,%rax,1)
jne    L3
cmp    $0x8,%ecx
mov    $0x1,%eax
jne    L2
mov    (%rdx),%rsi
xor    %eax,%eax
xor    %cl,%cl
L4:
mov    %rsi,%rdx
shr    %cl,%rdx
and    $0xf,%edx
movzbl -0x10(%rsp,%rdx,1),%edx
shl    %cl,%rdx
add    $0x4,%ecx
or     %rdx,%rax
cmp    $0x40,%ecx
jne    L4
movabs $0x01000b0d0e0fb848,%rsi
xor	%rsi,%rax
movabs $0x600967b3670e0385,%rdx
cmp    %rdx,%rax
jne    L2
setne  %al
movzbl %al,%eax

movl $4,%eax
movl $1,%ebx
movl $msg,%ecx
movl $13,%edx
int $0x80

movl $1,%eax
movl $0,%ebx
int $0x80

L2:
retq

.data
msg: .asciz "Hello,world!\n"
