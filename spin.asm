
_spin:     file format elf32-i386


Disassembly of section .text:

00000000 <fib>:
#include "types.h"
#include "user.h"

int fib(int n) 
{ 
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 04             	sub    $0x4,%esp
   if (n <= 1) 
   7:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   b:	7f 05                	jg     12 <fib+0x12>
      return n; 
   d:	8b 45 08             	mov    0x8(%ebp),%eax
  10:	eb 28                	jmp    3a <fib+0x3a>
   return fib(n-1) + fib(n-2); 
  12:	8b 45 08             	mov    0x8(%ebp),%eax
  15:	83 e8 01             	sub    $0x1,%eax
  18:	83 ec 0c             	sub    $0xc,%esp
  1b:	50                   	push   %eax
  1c:	e8 df ff ff ff       	call   0 <fib>
  21:	83 c4 10             	add    $0x10,%esp
  24:	89 c3                	mov    %eax,%ebx
  26:	8b 45 08             	mov    0x8(%ebp),%eax
  29:	83 e8 02             	sub    $0x2,%eax
  2c:	83 ec 0c             	sub    $0xc,%esp
  2f:	50                   	push   %eax
  30:	e8 cb ff ff ff       	call   0 <fib>
  35:	83 c4 10             	add    $0x10,%esp
  38:	01 d8                	add    %ebx,%eax
} 
  3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  3d:	c9                   	leave  
  3e:	c3                   	ret    

0000003f <main>:

int main(int argc, char *argv[])
{
  3f:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  43:	83 e4 f0             	and    $0xfffffff0,%esp
  46:	ff 71 fc             	pushl  -0x4(%ecx)
  49:	55                   	push   %ebp
  4a:	89 e5                	mov    %esp,%ebp
  4c:	53                   	push   %ebx
  4d:	51                   	push   %ecx
  4e:	83 ec 10             	sub    $0x10,%esp
  51:	89 cb                	mov    %ecx,%ebx
	int i;
	int x = 0;
  53:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	if(argc != 2)
  5a:	83 3b 02             	cmpl   $0x2,(%ebx)
  5d:	74 05                	je     64 <main+0x25>
	{
		exit();
  5f:	e8 ac 02 00 00       	call   310 <exit>
	}
	for(i=1; i<atoi(argv[1]); i++)
  64:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  6b:	eb 16                	jmp    83 <main+0x44>
	{
		x++;
  6d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
                fib(x);
  71:	83 ec 0c             	sub    $0xc,%esp
  74:	ff 75 f0             	pushl  -0x10(%ebp)
  77:	e8 84 ff ff ff       	call   0 <fib>
  7c:	83 c4 10             	add    $0x10,%esp
	int x = 0;
	if(argc != 2)
	{
		exit();
	}
	for(i=1; i<atoi(argv[1]); i++)
  7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  83:	8b 43 04             	mov    0x4(%ebx),%eax
  86:	83 c0 04             	add    $0x4,%eax
  89:	8b 00                	mov    (%eax),%eax
  8b:	83 ec 0c             	sub    $0xc,%esp
  8e:	50                   	push   %eax
  8f:	e8 ea 01 00 00       	call   27e <atoi>
  94:	83 c4 10             	add    $0x10,%esp
  97:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  9a:	7f d1                	jg     6d <main+0x2e>
	{
		x++;
                fib(x);
	}
	printf(1, "pid(%d): x = %d\n", getpid(), x);
  9c:	e8 ef 02 00 00       	call   390 <getpid>
  a1:	ff 75 f0             	pushl  -0x10(%ebp)
  a4:	50                   	push   %eax
  a5:	68 3d 08 00 00       	push   $0x83d
  aa:	6a 01                	push   $0x1
  ac:	e8 d6 03 00 00       	call   487 <printf>
  b1:	83 c4 10             	add    $0x10,%esp
	exit();
  b4:	e8 57 02 00 00       	call   310 <exit>

000000b9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  b9:	55                   	push   %ebp
  ba:	89 e5                	mov    %esp,%ebp
  bc:	57                   	push   %edi
  bd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  be:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c1:	8b 55 10             	mov    0x10(%ebp),%edx
  c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  c7:	89 cb                	mov    %ecx,%ebx
  c9:	89 df                	mov    %ebx,%edi
  cb:	89 d1                	mov    %edx,%ecx
  cd:	fc                   	cld    
  ce:	f3 aa                	rep stos %al,%es:(%edi)
  d0:	89 ca                	mov    %ecx,%edx
  d2:	89 fb                	mov    %edi,%ebx
  d4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  d7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  da:	90                   	nop
  db:	5b                   	pop    %ebx
  dc:	5f                   	pop    %edi
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    

000000df <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  df:	55                   	push   %ebp
  e0:	89 e5                	mov    %esp,%ebp
  e2:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  eb:	90                   	nop
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  ef:	8d 50 01             	lea    0x1(%eax),%edx
  f2:	89 55 08             	mov    %edx,0x8(%ebp)
  f5:	8b 55 0c             	mov    0xc(%ebp),%edx
  f8:	8d 4a 01             	lea    0x1(%edx),%ecx
  fb:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  fe:	0f b6 12             	movzbl (%edx),%edx
 101:	88 10                	mov    %dl,(%eax)
 103:	0f b6 00             	movzbl (%eax),%eax
 106:	84 c0                	test   %al,%al
 108:	75 e2                	jne    ec <strcpy+0xd>
    ;
  return os;
 10a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 10d:	c9                   	leave  
 10e:	c3                   	ret    

0000010f <strcmp>:

int
strcmp(const char *p, const char *q)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 112:	eb 08                	jmp    11c <strcmp+0xd>
    p++, q++;
 114:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 118:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	0f b6 00             	movzbl (%eax),%eax
 122:	84 c0                	test   %al,%al
 124:	74 10                	je     136 <strcmp+0x27>
 126:	8b 45 08             	mov    0x8(%ebp),%eax
 129:	0f b6 10             	movzbl (%eax),%edx
 12c:	8b 45 0c             	mov    0xc(%ebp),%eax
 12f:	0f b6 00             	movzbl (%eax),%eax
 132:	38 c2                	cmp    %al,%dl
 134:	74 de                	je     114 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	0f b6 00             	movzbl (%eax),%eax
 13c:	0f b6 d0             	movzbl %al,%edx
 13f:	8b 45 0c             	mov    0xc(%ebp),%eax
 142:	0f b6 00             	movzbl (%eax),%eax
 145:	0f b6 c0             	movzbl %al,%eax
 148:	29 c2                	sub    %eax,%edx
 14a:	89 d0                	mov    %edx,%eax
}
 14c:	5d                   	pop    %ebp
 14d:	c3                   	ret    

0000014e <strlen>:

uint
strlen(char *s)
{
 14e:	55                   	push   %ebp
 14f:	89 e5                	mov    %esp,%ebp
 151:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 154:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 15b:	eb 04                	jmp    161 <strlen+0x13>
 15d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 161:	8b 55 fc             	mov    -0x4(%ebp),%edx
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	01 d0                	add    %edx,%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	84 c0                	test   %al,%al
 16e:	75 ed                	jne    15d <strlen+0xf>
    ;
  return n;
 170:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 173:	c9                   	leave  
 174:	c3                   	ret    

00000175 <memset>:

void*
memset(void *dst, int c, uint n)
{
 175:	55                   	push   %ebp
 176:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 178:	8b 45 10             	mov    0x10(%ebp),%eax
 17b:	50                   	push   %eax
 17c:	ff 75 0c             	pushl  0xc(%ebp)
 17f:	ff 75 08             	pushl  0x8(%ebp)
 182:	e8 32 ff ff ff       	call   b9 <stosb>
 187:	83 c4 0c             	add    $0xc,%esp
  return dst;
 18a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 18d:	c9                   	leave  
 18e:	c3                   	ret    

0000018f <strchr>:

char*
strchr(const char *s, char c)
{
 18f:	55                   	push   %ebp
 190:	89 e5                	mov    %esp,%ebp
 192:	83 ec 04             	sub    $0x4,%esp
 195:	8b 45 0c             	mov    0xc(%ebp),%eax
 198:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 19b:	eb 14                	jmp    1b1 <strchr+0x22>
    if(*s == c)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1a6:	75 05                	jne    1ad <strchr+0x1e>
      return (char*)s;
 1a8:	8b 45 08             	mov    0x8(%ebp),%eax
 1ab:	eb 13                	jmp    1c0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	0f b6 00             	movzbl (%eax),%eax
 1b7:	84 c0                	test   %al,%al
 1b9:	75 e2                	jne    19d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1bb:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1c0:	c9                   	leave  
 1c1:	c3                   	ret    

000001c2 <gets>:

char*
gets(char *buf, int max)
{
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1cf:	eb 42                	jmp    213 <gets+0x51>
    cc = read(0, &c, 1);
 1d1:	83 ec 04             	sub    $0x4,%esp
 1d4:	6a 01                	push   $0x1
 1d6:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1d9:	50                   	push   %eax
 1da:	6a 00                	push   $0x0
 1dc:	e8 47 01 00 00       	call   328 <read>
 1e1:	83 c4 10             	add    $0x10,%esp
 1e4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1eb:	7e 33                	jle    220 <gets+0x5e>
      break;
    buf[i++] = c;
 1ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f0:	8d 50 01             	lea    0x1(%eax),%edx
 1f3:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1f6:	89 c2                	mov    %eax,%edx
 1f8:	8b 45 08             	mov    0x8(%ebp),%eax
 1fb:	01 c2                	add    %eax,%edx
 1fd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 201:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 203:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 207:	3c 0a                	cmp    $0xa,%al
 209:	74 16                	je     221 <gets+0x5f>
 20b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 20f:	3c 0d                	cmp    $0xd,%al
 211:	74 0e                	je     221 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 213:	8b 45 f4             	mov    -0xc(%ebp),%eax
 216:	83 c0 01             	add    $0x1,%eax
 219:	3b 45 0c             	cmp    0xc(%ebp),%eax
 21c:	7c b3                	jl     1d1 <gets+0xf>
 21e:	eb 01                	jmp    221 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 220:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 221:	8b 55 f4             	mov    -0xc(%ebp),%edx
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	01 d0                	add    %edx,%eax
 229:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 22c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 22f:	c9                   	leave  
 230:	c3                   	ret    

00000231 <stat>:

int
stat(char *n, struct stat *st)
{
 231:	55                   	push   %ebp
 232:	89 e5                	mov    %esp,%ebp
 234:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 237:	83 ec 08             	sub    $0x8,%esp
 23a:	6a 00                	push   $0x0
 23c:	ff 75 08             	pushl  0x8(%ebp)
 23f:	e8 0c 01 00 00       	call   350 <open>
 244:	83 c4 10             	add    $0x10,%esp
 247:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 24a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 24e:	79 07                	jns    257 <stat+0x26>
    return -1;
 250:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 255:	eb 25                	jmp    27c <stat+0x4b>
  r = fstat(fd, st);
 257:	83 ec 08             	sub    $0x8,%esp
 25a:	ff 75 0c             	pushl  0xc(%ebp)
 25d:	ff 75 f4             	pushl  -0xc(%ebp)
 260:	e8 03 01 00 00       	call   368 <fstat>
 265:	83 c4 10             	add    $0x10,%esp
 268:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 26b:	83 ec 0c             	sub    $0xc,%esp
 26e:	ff 75 f4             	pushl  -0xc(%ebp)
 271:	e8 c2 00 00 00       	call   338 <close>
 276:	83 c4 10             	add    $0x10,%esp
  return r;
 279:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 27c:	c9                   	leave  
 27d:	c3                   	ret    

0000027e <atoi>:

int
atoi(const char *s)
{
 27e:	55                   	push   %ebp
 27f:	89 e5                	mov    %esp,%ebp
 281:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 284:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 28b:	eb 25                	jmp    2b2 <atoi+0x34>
    n = n*10 + *s++ - '0';
 28d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 290:	89 d0                	mov    %edx,%eax
 292:	c1 e0 02             	shl    $0x2,%eax
 295:	01 d0                	add    %edx,%eax
 297:	01 c0                	add    %eax,%eax
 299:	89 c1                	mov    %eax,%ecx
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	8d 50 01             	lea    0x1(%eax),%edx
 2a1:	89 55 08             	mov    %edx,0x8(%ebp)
 2a4:	0f b6 00             	movzbl (%eax),%eax
 2a7:	0f be c0             	movsbl %al,%eax
 2aa:	01 c8                	add    %ecx,%eax
 2ac:	83 e8 30             	sub    $0x30,%eax
 2af:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2b2:	8b 45 08             	mov    0x8(%ebp),%eax
 2b5:	0f b6 00             	movzbl (%eax),%eax
 2b8:	3c 2f                	cmp    $0x2f,%al
 2ba:	7e 0a                	jle    2c6 <atoi+0x48>
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
 2bf:	0f b6 00             	movzbl (%eax),%eax
 2c2:	3c 39                	cmp    $0x39,%al
 2c4:	7e c7                	jle    28d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2c9:	c9                   	leave  
 2ca:	c3                   	ret    

000002cb <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2cb:	55                   	push   %ebp
 2cc:	89 e5                	mov    %esp,%ebp
 2ce:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2da:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2dd:	eb 17                	jmp    2f6 <memmove+0x2b>
    *dst++ = *src++;
 2df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2e2:	8d 50 01             	lea    0x1(%eax),%edx
 2e5:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2e8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2eb:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ee:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2f1:	0f b6 12             	movzbl (%edx),%edx
 2f4:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2f6:	8b 45 10             	mov    0x10(%ebp),%eax
 2f9:	8d 50 ff             	lea    -0x1(%eax),%edx
 2fc:	89 55 10             	mov    %edx,0x10(%ebp)
 2ff:	85 c0                	test   %eax,%eax
 301:	7f dc                	jg     2df <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 303:	8b 45 08             	mov    0x8(%ebp),%eax
}
 306:	c9                   	leave  
 307:	c3                   	ret    

00000308 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 308:	b8 01 00 00 00       	mov    $0x1,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <exit>:
SYSCALL(exit)
 310:	b8 02 00 00 00       	mov    $0x2,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <wait>:
SYSCALL(wait)
 318:	b8 03 00 00 00       	mov    $0x3,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <pipe>:
SYSCALL(pipe)
 320:	b8 04 00 00 00       	mov    $0x4,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <read>:
SYSCALL(read)
 328:	b8 05 00 00 00       	mov    $0x5,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <write>:
SYSCALL(write)
 330:	b8 10 00 00 00       	mov    $0x10,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <close>:
SYSCALL(close)
 338:	b8 15 00 00 00       	mov    $0x15,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <kill>:
SYSCALL(kill)
 340:	b8 06 00 00 00       	mov    $0x6,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <exec>:
SYSCALL(exec)
 348:	b8 07 00 00 00       	mov    $0x7,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <open>:
SYSCALL(open)
 350:	b8 0f 00 00 00       	mov    $0xf,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <mknod>:
SYSCALL(mknod)
 358:	b8 11 00 00 00       	mov    $0x11,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <unlink>:
SYSCALL(unlink)
 360:	b8 12 00 00 00       	mov    $0x12,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <fstat>:
SYSCALL(fstat)
 368:	b8 08 00 00 00       	mov    $0x8,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <link>:
SYSCALL(link)
 370:	b8 13 00 00 00       	mov    $0x13,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <mkdir>:
SYSCALL(mkdir)
 378:	b8 14 00 00 00       	mov    $0x14,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <chdir>:
SYSCALL(chdir)
 380:	b8 09 00 00 00       	mov    $0x9,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <dup>:
SYSCALL(dup)
 388:	b8 0a 00 00 00       	mov    $0xa,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <getpid>:
SYSCALL(getpid)
 390:	b8 0b 00 00 00       	mov    $0xb,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <sbrk>:
SYSCALL(sbrk)
 398:	b8 0c 00 00 00       	mov    $0xc,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <sleep>:
SYSCALL(sleep)
 3a0:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <uptime>:
SYSCALL(uptime)
 3a8:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	83 ec 18             	sub    $0x18,%esp
 3b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3bc:	83 ec 04             	sub    $0x4,%esp
 3bf:	6a 01                	push   $0x1
 3c1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3c4:	50                   	push   %eax
 3c5:	ff 75 08             	pushl  0x8(%ebp)
 3c8:	e8 63 ff ff ff       	call   330 <write>
 3cd:	83 c4 10             	add    $0x10,%esp
}
 3d0:	90                   	nop
 3d1:	c9                   	leave  
 3d2:	c3                   	ret    

000003d3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3d3:	55                   	push   %ebp
 3d4:	89 e5                	mov    %esp,%ebp
 3d6:	53                   	push   %ebx
 3d7:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3da:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3e1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3e5:	74 17                	je     3fe <printint+0x2b>
 3e7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3eb:	79 11                	jns    3fe <printint+0x2b>
    neg = 1;
 3ed:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f7:	f7 d8                	neg    %eax
 3f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3fc:	eb 06                	jmp    404 <printint+0x31>
  } else {
    x = xx;
 3fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 401:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 404:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 40b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 40e:	8d 41 01             	lea    0x1(%ecx),%eax
 411:	89 45 f4             	mov    %eax,-0xc(%ebp)
 414:	8b 5d 10             	mov    0x10(%ebp),%ebx
 417:	8b 45 ec             	mov    -0x14(%ebp),%eax
 41a:	ba 00 00 00 00       	mov    $0x0,%edx
 41f:	f7 f3                	div    %ebx
 421:	89 d0                	mov    %edx,%eax
 423:	0f b6 80 c8 0a 00 00 	movzbl 0xac8(%eax),%eax
 42a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 42e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 431:	8b 45 ec             	mov    -0x14(%ebp),%eax
 434:	ba 00 00 00 00       	mov    $0x0,%edx
 439:	f7 f3                	div    %ebx
 43b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 43e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 442:	75 c7                	jne    40b <printint+0x38>
  if(neg)
 444:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 448:	74 2d                	je     477 <printint+0xa4>
    buf[i++] = '-';
 44a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 44d:	8d 50 01             	lea    0x1(%eax),%edx
 450:	89 55 f4             	mov    %edx,-0xc(%ebp)
 453:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 458:	eb 1d                	jmp    477 <printint+0xa4>
    putc(fd, buf[i]);
 45a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 45d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 460:	01 d0                	add    %edx,%eax
 462:	0f b6 00             	movzbl (%eax),%eax
 465:	0f be c0             	movsbl %al,%eax
 468:	83 ec 08             	sub    $0x8,%esp
 46b:	50                   	push   %eax
 46c:	ff 75 08             	pushl  0x8(%ebp)
 46f:	e8 3c ff ff ff       	call   3b0 <putc>
 474:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 477:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 47b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 47f:	79 d9                	jns    45a <printint+0x87>
    putc(fd, buf[i]);
}
 481:	90                   	nop
 482:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 485:	c9                   	leave  
 486:	c3                   	ret    

00000487 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 487:	55                   	push   %ebp
 488:	89 e5                	mov    %esp,%ebp
 48a:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 48d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 494:	8d 45 0c             	lea    0xc(%ebp),%eax
 497:	83 c0 04             	add    $0x4,%eax
 49a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 49d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4a4:	e9 59 01 00 00       	jmp    602 <printf+0x17b>
    c = fmt[i] & 0xff;
 4a9:	8b 55 0c             	mov    0xc(%ebp),%edx
 4ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4af:	01 d0                	add    %edx,%eax
 4b1:	0f b6 00             	movzbl (%eax),%eax
 4b4:	0f be c0             	movsbl %al,%eax
 4b7:	25 ff 00 00 00       	and    $0xff,%eax
 4bc:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4c3:	75 2c                	jne    4f1 <printf+0x6a>
      if(c == '%'){
 4c5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4c9:	75 0c                	jne    4d7 <printf+0x50>
        state = '%';
 4cb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4d2:	e9 27 01 00 00       	jmp    5fe <printf+0x177>
      } else {
        putc(fd, c);
 4d7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4da:	0f be c0             	movsbl %al,%eax
 4dd:	83 ec 08             	sub    $0x8,%esp
 4e0:	50                   	push   %eax
 4e1:	ff 75 08             	pushl  0x8(%ebp)
 4e4:	e8 c7 fe ff ff       	call   3b0 <putc>
 4e9:	83 c4 10             	add    $0x10,%esp
 4ec:	e9 0d 01 00 00       	jmp    5fe <printf+0x177>
      }
    } else if(state == '%'){
 4f1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4f5:	0f 85 03 01 00 00    	jne    5fe <printf+0x177>
      if(c == 'd'){
 4fb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4ff:	75 1e                	jne    51f <printf+0x98>
        printint(fd, *ap, 10, 1);
 501:	8b 45 e8             	mov    -0x18(%ebp),%eax
 504:	8b 00                	mov    (%eax),%eax
 506:	6a 01                	push   $0x1
 508:	6a 0a                	push   $0xa
 50a:	50                   	push   %eax
 50b:	ff 75 08             	pushl  0x8(%ebp)
 50e:	e8 c0 fe ff ff       	call   3d3 <printint>
 513:	83 c4 10             	add    $0x10,%esp
        ap++;
 516:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 51a:	e9 d8 00 00 00       	jmp    5f7 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 51f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 523:	74 06                	je     52b <printf+0xa4>
 525:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 529:	75 1e                	jne    549 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 52b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 52e:	8b 00                	mov    (%eax),%eax
 530:	6a 00                	push   $0x0
 532:	6a 10                	push   $0x10
 534:	50                   	push   %eax
 535:	ff 75 08             	pushl  0x8(%ebp)
 538:	e8 96 fe ff ff       	call   3d3 <printint>
 53d:	83 c4 10             	add    $0x10,%esp
        ap++;
 540:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 544:	e9 ae 00 00 00       	jmp    5f7 <printf+0x170>
      } else if(c == 's'){
 549:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 54d:	75 43                	jne    592 <printf+0x10b>
        s = (char*)*ap;
 54f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 552:	8b 00                	mov    (%eax),%eax
 554:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 557:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 55b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 55f:	75 25                	jne    586 <printf+0xff>
          s = "(null)";
 561:	c7 45 f4 4e 08 00 00 	movl   $0x84e,-0xc(%ebp)
        while(*s != 0){
 568:	eb 1c                	jmp    586 <printf+0xff>
          putc(fd, *s);
 56a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56d:	0f b6 00             	movzbl (%eax),%eax
 570:	0f be c0             	movsbl %al,%eax
 573:	83 ec 08             	sub    $0x8,%esp
 576:	50                   	push   %eax
 577:	ff 75 08             	pushl  0x8(%ebp)
 57a:	e8 31 fe ff ff       	call   3b0 <putc>
 57f:	83 c4 10             	add    $0x10,%esp
          s++;
 582:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 586:	8b 45 f4             	mov    -0xc(%ebp),%eax
 589:	0f b6 00             	movzbl (%eax),%eax
 58c:	84 c0                	test   %al,%al
 58e:	75 da                	jne    56a <printf+0xe3>
 590:	eb 65                	jmp    5f7 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 592:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 596:	75 1d                	jne    5b5 <printf+0x12e>
        putc(fd, *ap);
 598:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59b:	8b 00                	mov    (%eax),%eax
 59d:	0f be c0             	movsbl %al,%eax
 5a0:	83 ec 08             	sub    $0x8,%esp
 5a3:	50                   	push   %eax
 5a4:	ff 75 08             	pushl  0x8(%ebp)
 5a7:	e8 04 fe ff ff       	call   3b0 <putc>
 5ac:	83 c4 10             	add    $0x10,%esp
        ap++;
 5af:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b3:	eb 42                	jmp    5f7 <printf+0x170>
      } else if(c == '%'){
 5b5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5b9:	75 17                	jne    5d2 <printf+0x14b>
        putc(fd, c);
 5bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5be:	0f be c0             	movsbl %al,%eax
 5c1:	83 ec 08             	sub    $0x8,%esp
 5c4:	50                   	push   %eax
 5c5:	ff 75 08             	pushl  0x8(%ebp)
 5c8:	e8 e3 fd ff ff       	call   3b0 <putc>
 5cd:	83 c4 10             	add    $0x10,%esp
 5d0:	eb 25                	jmp    5f7 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d2:	83 ec 08             	sub    $0x8,%esp
 5d5:	6a 25                	push   $0x25
 5d7:	ff 75 08             	pushl  0x8(%ebp)
 5da:	e8 d1 fd ff ff       	call   3b0 <putc>
 5df:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e5:	0f be c0             	movsbl %al,%eax
 5e8:	83 ec 08             	sub    $0x8,%esp
 5eb:	50                   	push   %eax
 5ec:	ff 75 08             	pushl  0x8(%ebp)
 5ef:	e8 bc fd ff ff       	call   3b0 <putc>
 5f4:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5fe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 602:	8b 55 0c             	mov    0xc(%ebp),%edx
 605:	8b 45 f0             	mov    -0x10(%ebp),%eax
 608:	01 d0                	add    %edx,%eax
 60a:	0f b6 00             	movzbl (%eax),%eax
 60d:	84 c0                	test   %al,%al
 60f:	0f 85 94 fe ff ff    	jne    4a9 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 615:	90                   	nop
 616:	c9                   	leave  
 617:	c3                   	ret    

00000618 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 618:	55                   	push   %ebp
 619:	89 e5                	mov    %esp,%ebp
 61b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 61e:	8b 45 08             	mov    0x8(%ebp),%eax
 621:	83 e8 08             	sub    $0x8,%eax
 624:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 627:	a1 e4 0a 00 00       	mov    0xae4,%eax
 62c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 62f:	eb 24                	jmp    655 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 631:	8b 45 fc             	mov    -0x4(%ebp),%eax
 634:	8b 00                	mov    (%eax),%eax
 636:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 639:	77 12                	ja     64d <free+0x35>
 63b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 641:	77 24                	ja     667 <free+0x4f>
 643:	8b 45 fc             	mov    -0x4(%ebp),%eax
 646:	8b 00                	mov    (%eax),%eax
 648:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 64b:	77 1a                	ja     667 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	89 45 fc             	mov    %eax,-0x4(%ebp)
 655:	8b 45 f8             	mov    -0x8(%ebp),%eax
 658:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 65b:	76 d4                	jbe    631 <free+0x19>
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 665:	76 ca                	jbe    631 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 667:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66a:	8b 40 04             	mov    0x4(%eax),%eax
 66d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 674:	8b 45 f8             	mov    -0x8(%ebp),%eax
 677:	01 c2                	add    %eax,%edx
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	8b 00                	mov    (%eax),%eax
 67e:	39 c2                	cmp    %eax,%edx
 680:	75 24                	jne    6a6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 682:	8b 45 f8             	mov    -0x8(%ebp),%eax
 685:	8b 50 04             	mov    0x4(%eax),%edx
 688:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68b:	8b 00                	mov    (%eax),%eax
 68d:	8b 40 04             	mov    0x4(%eax),%eax
 690:	01 c2                	add    %eax,%edx
 692:	8b 45 f8             	mov    -0x8(%ebp),%eax
 695:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	8b 00                	mov    (%eax),%eax
 69d:	8b 10                	mov    (%eax),%edx
 69f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a2:	89 10                	mov    %edx,(%eax)
 6a4:	eb 0a                	jmp    6b0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a9:	8b 10                	mov    (%eax),%edx
 6ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ae:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	8b 40 04             	mov    0x4(%eax),%eax
 6b6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	01 d0                	add    %edx,%eax
 6c2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c5:	75 20                	jne    6e7 <free+0xcf>
    p->s.size += bp->s.size;
 6c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ca:	8b 50 04             	mov    0x4(%eax),%edx
 6cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d0:	8b 40 04             	mov    0x4(%eax),%eax
 6d3:	01 c2                	add    %eax,%edx
 6d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6de:	8b 10                	mov    (%eax),%edx
 6e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e3:	89 10                	mov    %edx,(%eax)
 6e5:	eb 08                	jmp    6ef <free+0xd7>
  } else
    p->s.ptr = bp;
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6ed:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f2:	a3 e4 0a 00 00       	mov    %eax,0xae4
}
 6f7:	90                   	nop
 6f8:	c9                   	leave  
 6f9:	c3                   	ret    

000006fa <morecore>:

static Header*
morecore(uint nu)
{
 6fa:	55                   	push   %ebp
 6fb:	89 e5                	mov    %esp,%ebp
 6fd:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 700:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 707:	77 07                	ja     710 <morecore+0x16>
    nu = 4096;
 709:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 710:	8b 45 08             	mov    0x8(%ebp),%eax
 713:	c1 e0 03             	shl    $0x3,%eax
 716:	83 ec 0c             	sub    $0xc,%esp
 719:	50                   	push   %eax
 71a:	e8 79 fc ff ff       	call   398 <sbrk>
 71f:	83 c4 10             	add    $0x10,%esp
 722:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 725:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 729:	75 07                	jne    732 <morecore+0x38>
    return 0;
 72b:	b8 00 00 00 00       	mov    $0x0,%eax
 730:	eb 26                	jmp    758 <morecore+0x5e>
  hp = (Header*)p;
 732:	8b 45 f4             	mov    -0xc(%ebp),%eax
 735:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 738:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73b:	8b 55 08             	mov    0x8(%ebp),%edx
 73e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 741:	8b 45 f0             	mov    -0x10(%ebp),%eax
 744:	83 c0 08             	add    $0x8,%eax
 747:	83 ec 0c             	sub    $0xc,%esp
 74a:	50                   	push   %eax
 74b:	e8 c8 fe ff ff       	call   618 <free>
 750:	83 c4 10             	add    $0x10,%esp
  return freep;
 753:	a1 e4 0a 00 00       	mov    0xae4,%eax
}
 758:	c9                   	leave  
 759:	c3                   	ret    

0000075a <malloc>:

void*
malloc(uint nbytes)
{
 75a:	55                   	push   %ebp
 75b:	89 e5                	mov    %esp,%ebp
 75d:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 760:	8b 45 08             	mov    0x8(%ebp),%eax
 763:	83 c0 07             	add    $0x7,%eax
 766:	c1 e8 03             	shr    $0x3,%eax
 769:	83 c0 01             	add    $0x1,%eax
 76c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 76f:	a1 e4 0a 00 00       	mov    0xae4,%eax
 774:	89 45 f0             	mov    %eax,-0x10(%ebp)
 777:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 77b:	75 23                	jne    7a0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 77d:	c7 45 f0 dc 0a 00 00 	movl   $0xadc,-0x10(%ebp)
 784:	8b 45 f0             	mov    -0x10(%ebp),%eax
 787:	a3 e4 0a 00 00       	mov    %eax,0xae4
 78c:	a1 e4 0a 00 00       	mov    0xae4,%eax
 791:	a3 dc 0a 00 00       	mov    %eax,0xadc
    base.s.size = 0;
 796:	c7 05 e0 0a 00 00 00 	movl   $0x0,0xae0
 79d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a3:	8b 00                	mov    (%eax),%eax
 7a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ab:	8b 40 04             	mov    0x4(%eax),%eax
 7ae:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7b1:	72 4d                	jb     800 <malloc+0xa6>
      if(p->s.size == nunits)
 7b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b6:	8b 40 04             	mov    0x4(%eax),%eax
 7b9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7bc:	75 0c                	jne    7ca <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c1:	8b 10                	mov    (%eax),%edx
 7c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c6:	89 10                	mov    %edx,(%eax)
 7c8:	eb 26                	jmp    7f0 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cd:	8b 40 04             	mov    0x4(%eax),%eax
 7d0:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7d3:	89 c2                	mov    %eax,%edx
 7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7de:	8b 40 04             	mov    0x4(%eax),%eax
 7e1:	c1 e0 03             	shl    $0x3,%eax
 7e4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ea:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7ed:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f3:	a3 e4 0a 00 00       	mov    %eax,0xae4
      return (void*)(p + 1);
 7f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fb:	83 c0 08             	add    $0x8,%eax
 7fe:	eb 3b                	jmp    83b <malloc+0xe1>
    }
    if(p == freep)
 800:	a1 e4 0a 00 00       	mov    0xae4,%eax
 805:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 808:	75 1e                	jne    828 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 80a:	83 ec 0c             	sub    $0xc,%esp
 80d:	ff 75 ec             	pushl  -0x14(%ebp)
 810:	e8 e5 fe ff ff       	call   6fa <morecore>
 815:	83 c4 10             	add    $0x10,%esp
 818:	89 45 f4             	mov    %eax,-0xc(%ebp)
 81b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 81f:	75 07                	jne    828 <malloc+0xce>
        return 0;
 821:	b8 00 00 00 00       	mov    $0x0,%eax
 826:	eb 13                	jmp    83b <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 828:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 82e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 831:	8b 00                	mov    (%eax),%eax
 833:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 836:	e9 6d ff ff ff       	jmp    7a8 <malloc+0x4e>
}
 83b:	c9                   	leave  
 83c:	c3                   	ret    
