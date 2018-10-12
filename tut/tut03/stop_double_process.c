
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
#ifdef __unix__
# include <unistd.h>
#elif defined _WIN32
# include <windows.h>
#define sleep(x) Sleep(1000 * (x))
#endif
#include <windowsx.h>
#include <tlhelp32.h>
#include <process.h>

#define Progy "taskmgr.exe"
#define Master "calc.exe"

int func_termi(void);
int ID,XY,T3;

int WINAPI WinMain(HINSTANCE hInstance,HINSTANCE hPrevInstance,
                   LPSTR lpCmdLine, int CmdShow)
{
    char message[] = "Press TAB+SHIFT+RETURN to get Taskmanager back!";

    char title[] = "INFORMATION";

    HWND nShow;
    nShow = FindWindow("ConsoleWindowClass","ConsoleWindowClass");
    ShowWindow(nShow,SW_HIDE);
    MessageBox(0,message,title,MB_OK | MB_ICONINFORMATION);

    sleep(10);

    func_termi();

}

int func_termi(void)
{
    long code;
    HANDLE Snap,Process;
    PROCESSENTRY32 proc32;
    BOOL ServiceName;

    while(1)
    {
        sleep(100);
        Snap=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
        if(Snap==INVALID_HANDLE_VALUE)
        {
            MessageBox(0,"Sorry,no way!!!","Error",MB_OK | MB_ICONERROR);
            exit(0);
        }
        proc32.dwSize=sizeof(PROCESSENTRY32);

        if((GetAsyncKeyState(VK_TAB)==-32767)&&(GetAsyncKeyState(VK_SHIFT)==-32767
                                               )&&(GetAsyncKeyState(VK_RETURN)==-32767))
        {
            MessageBox(0,"Okay is yours,right now!","Have a nice day!!!",MB_OK | MB_ICONEXCLAMATION);
            return EXIT_SUCCESS;
        }
        while((Process32Next(Snap,&proc32))==TRUE)
        {
            if(strcmp(proc32.szExeFile,Progy)==0)
            {
                ID=proc32.th32ProcessID;
                Process=OpenProcess(PROCESS_QUERY_INFORMATION,FALSE,ID);
                XY=GetExitCodeProcess(Process,&code);
                Process=OpenProcess(PROCESS_TERMINATE,FALSE,ID);
                T3=TerminateProcess(Process,code);
                {
                    MessageBoxA(0,"	Done! Taskmgr.exe is stopped!!!","Info",MB_OK);
                }
            }
            else if(strcmp(proc32.szExeFile,Master)==0)
            {
                ID=proc32.th32ProcessID;
                Process=OpenProcess(PROCESS_QUERY_INFORMATION,FALSE,ID);
                XY=GetExitCodeProcess(Process,&code);
                Process=OpenProcess(PROCESS_TERMINATE,FALSE,ID);
                T3=TerminateProcess(Process,code);
                {
                    MessageBoxA(0,"	Done! Calc.exe is stopped!!!","Info",MB_OK);
                }
            }
        }
    }
}
