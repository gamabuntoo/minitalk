/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gule-bat <gule-bat@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/05 23:41:26 by gule-bat          #+#    #+#             */
/*   Updated: 2025/05/06 21:33:11 by gule-bat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include "./libft/libft.h"

void	receiver(int signum, siginfo_t *info, void *context)
{
	static char	c;
	static int	i;
	static int	ct;
	pid_t	pid;
	
	(void)context;
	c <<= 1;
	pid = info->si_pid;
	if (signum == SIGUSR1)
	{
		c |= 1;
		ct = 0;
	}
	if (signum == SIGUSR2)
		ct++;
	kill(pid, SIGUSR1);
	i++;
	if (i == 8)
	{
		if (ct == 8)
		{
			kill(pid, SIGUSR1);
			ft_putstr_fd("\n", 1);
		}
		ft_putchar_fd(c, 1);
		c = 0;
		i = 0;
	}
}

int	main(void) 
{
	struct sigaction	signals;
	pid_t				pid;

	pid = getpid();
	signals.sa_sigaction = receiver;
	sigemptyset(&signals.sa_mask);
	signals.sa_flags = SA_SIGINFO;	

	printf("PID SERVER: %d\n", pid);

	sigaction(SIGUSR1, &signals, NULL);
	sigaction(SIGUSR2, &signals, NULL);
	printf("Pause...\n");
	while (1)
		pause();
	return 0;
}
