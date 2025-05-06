/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gule-bat <gule-bat@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/05 23:41:26 by gule-bat          #+#    #+#             */
/*   Updated: 2025/05/05 23:43:43 by gule-bat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>

void	signal_handler(int signum) 
{
	pid_t	pid;
	int	i;

	i = 0;	
	pid = fork();
	if (signum == 2 && pid != 0)
		printf("Received SIGINT! %d pid = %d\n", signum, pid);
	if (signum == 15 && pid != 0)
		printf("AAAAAAAAAAAAAAAAAAAAAAAA le demon ressort de moi \nReceived SIGTERM! %d pid = %d\n\n", signum, pid);
	if (pid == 0)
	{
		printf("%d pid killed    nb = %d\n", pid, signum);
		sleep(1);
		if (signum == 2)
			printf("%d sigint before terminating\n\n", signum);
		else
		{
			printf("riz\n");
			exit(0);
		}
		i = kill(pid, SIGTERM);
	}
	waitpid(pid, 0, NULL);
	printf("%d pid remaining till now   signal %d\n", pid, signum);
	if (signum == 15)
		printf("sigterm zzzzzzzzz\n");
	else
		printf("sigint zzzzzzzzz\n");
	return ;
}

int	main() 
{
	struct sigaction	signals;
	pid_t			pid;

	pid = getpid();
	signals.sa_handler = signal_handler;
	sigemptyset(&signals.sa_mask);
	signals.sa_flags = 0;

	sigaction(SIGINT, &signals, NULL);
	sigaction(SIGTERM, &signals, NULL);
//	sigaaddset(&signals, SIGINT);
//	sigaaddset(&signals, SIGTERM);
// 	signal(SIGINT, signal_handler);
//	signal(SIGTERM, signal_handler);
	printf("Pause...\n");
	pause();
	printf("...   Enfin !\n");
	return 0;
}
