#!/usr/bin/perl

use DBI; #cpan > install DBI
use DBD::mysql;
use Term::ANSIColor; # cpan > install Term::ANSIColor

print color("red"), qq (
               ...
             ;::::;
           ;::::; :;
         ;:::::'   :;
        ;:::::;     ;.
       ,:::::'       ; DB Reaper OOO\
       ::::::;       ;          OOOOO\
       ;:::::;       ;         OOOOOOOO
      ,;::::::;     ;'         / OOOOOOO
    ;:::::::::`. ,,,;.        /  / DOOOOOO
  .';:::::::::::::::::;,     /  /     DOOOO
 ,::::::;::::::;;;;::::;,   /  /        DOOO
;`::::::`'::::::;;;::::: ,#/  /          DOOO
:`:::::::`;::::::;;::: ;::#  /            DOOO
::`:::::::`;:::::::: ;::::# /              DOO
`:`:::::::`;:::::: ;::::::#/               DOO
 :::`:::::::`;; ;:::::::::##                OO
 ::::`:::::::`;::::::::;:::#                OO
 `:::::`::::::::::::;'`:;::#                O
  `:::::`::::::::;' /  / `:#
   ::::::`:::::;'  /  /   `#
), color("reset");

print color("bright_blue on_black"), ("[1] CHECK THE CONNECTION TO SINGAL DB\n"), color("reset");
print color("bright_blue on_black"), ("[2] CHECK THE CONNECTION TO MULTIPLE (LIST) DB'S\n"), color("reset");
print color("bright_blue on_black"), ("[3] CONTACT AUTHOR\n"), color("reset");
print color("bright_yellow"),("\n[-] CHOICE (1/2/3) #> "), color("reset");
my $check_choice = <STDIN>;

if($check_choice == "1")
{
	print color("bright_white"), ("\n[-] DB HOST (SITE URL) #> "), color("reset");
	chop (my $HOST = <STDIN>);
	print color("bright_white"), ("[-] DB USERNAME #> "), color("reset");
	chop (my $USER = <STDIN>);
	print color("bright_white"), ("[-] DB PASSWORD #> "), color("reset");
	chop (my $PASS = <STDIN>);
	print color("bright_white"), ("[-] DB NAME #> "), color("reset");
	chop (my $NAME = <STDIN>);
	$port = "3306";
	$CON1 = "dbi:mysql:$NAME:$HOST:$port";
	$DB_Reaper = DBI->connect($CON1, $USER, $PASS, {'PrintError'=>0});
	if($DB_Reaper)
	{
		print ("\n");
		print color("white"), ("-----------------------------\n"), color("reset");
		print color("green"), ("[*] CONNECTED SUCCESSFULLY [*] \n"), color("reset");
		print color("green"), ("[OK] HOST : ",$HOST), color("reset");
		print color("green"), ("\n[OK] DB   : ",$NAME), color("reset");
		print color("green"), ("\n[OK] USER : ",$USER), color("reset");
		print color("green"), ("\n[OK] PASS : ",$PASS), color("reset");
		print color("white"), ("\n-----------------------------\n"), color("reset");

	}
	else
	{
		print ("\n");
		print color("white"), ("-----------------------------\n"), color("reset");
		print color("red"), ("[*] NOT CONNECTED [*] \n"), color("reset");
		print color("red"), ("[NOT OK] HOST : ",$HOST), color("reset");
		print color("red"), ("\n[NOT OK] DB   : ",$NAME), color("reset");
		print color("red"), ("\n[NOT OK] USER : ",$USER), color("reset");
		print color("red"), ("\n[NOT OK] PASS : ",$PASS), color("reset");
		print color("white"), ("\n-----------------------------\n"), color("reset");

	}
	

}

if($check_choice == "2")
{
	print color("bright_white"), ("\n[-] FILE (LIST.txt) #> "), color("reset");
	chop (my $file = <STDIN>);
	open my $info, $file or die " [!] Could not open $file: $! [!] ";
		while( my $site_file = <$info>)  
	{  
		my $targetList;
		chop ($targetList = $site_file);
		
		foreach($targetList)
		{
			my ($HOST, $USER, $PASS, $NAME) = split /,/, $targetList;
			$port = "3306";
			$CON1 = "dbi:mysql:$NAME:$HOST:$port";
			$DB_Reaper = DBI->connect($CON1, $USER, $PASS, {'PrintError'=>0});
			if($DB_Reaper)
			{
				print ("\n");
				print color("white"), ("-----------------------------\n"), color("reset");
				print color("green"), ("[*] CONNECTED SUCCESSFULLY [*] \n"), color("reset");
				print color("green"), ("[OK] HOST : ",$HOST), color("reset");
				print color("green"), ("\n[OK] DB   : ",$NAME), color("reset");
				print color("green"), ("\n[OK] USER : ",$USER), color("reset");
				print color("green"), ("\n[OK] PASS : ",$PASS), color("reset");
				print color("white"), ("\n-----------------------------\n"), color("reset");

			}
			else
			{
				print ("\n");
				print color("white"), ("-----------------------------\n"), color("reset");
				print color("red"), ("[*] NOT CONNECTED [*] \n"), color("reset");
				print color("red"), ("[NOT OK] HOST : ",$HOST), color("reset");
				print color("red"), ("\n[NOT OK] DB   : ",$NAME), color("reset");
				print color("red"), ("\n[NOT OK] USER : ",$USER), color("reset");
				print color("red"), ("\n[NOT OK] PASS : ",$PASS), color("reset");
				print color("white"), ("\n-----------------------------\n"), color("reset");

			}
		}
	}
}
if($check_choice == "3")
{
	print color("red on_yellow"), ("\n[-] MOHAMMED ADEL\n"), color("reset");
	print color("red on_yellow"), ("[-] https://twitter.com/moh_security\n"), color("reset");
	print color("red on_yellow"), ("[-] http://github.com/inurlx\n\n"), color("reset");
}

