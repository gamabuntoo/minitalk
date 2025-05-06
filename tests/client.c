/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gule-bat <gule-bat@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/05/06 15:23:44 by gule-bat          #+#    #+#             */
/*   Updated: 2025/05/06 21:39:17 by gule-bat         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include "./libft/libft.h"

void	errorprint(void)
{
	ft_putstr_fd("Error PID", 2);
	exit(EXIT_FAILURE);
}

void	receiver(int signum, siginfo_t *info, void *context)
{
	(void)signum;
	(void)context;
	ft_putstr_fd("Message received by server (pid = ", 1);
	ft_putnbr_fd(info->si_pid, 1);
	ft_putstr_fd(")\n", 1);
	exit(EXIT_SUCCESS);
}

int	ft_isdigit_check(char *str)
{
	int	i;
	
	i = 0;
	while (str[i] != 0)
	{
		if (ft_isdigit(str[i]) == 1)
			i++;
		else
			return (-1);
	}
	return (1);
}

void	str_to_bit(char *str, pid_t pid)
{
	unsigned int		i;
	int j;
	char	c;

	c = 0;
	j = -1;
	while (str[++j] != '\0')
	{
		i = 8;
		c = str[j];
		while (i--)
		{
			if (c >> i & 1)
			{
				if (kill(pid, SIGUSR1) == -1)
				{
					ft_putstr_fd("Error PID", 2);
					return ;
				}
			}
			else
			{
				if (kill(pid, SIGUSR2) == -1)
				{
					ft_putstr_fd("Error PID", 2);
					return ;
				}
			}
			usleep(600);
		}
	}
	i = 8;
	while (i--)
	{
		kill(pid, SIGUSR2);
		usleep(600);
	}
}

int	main(int argc, char **argv)
{
	struct sigaction	signals;

	if (argc != 3 || ft_isdigit_check(argv[1]) == -1)
		return (ft_putstr_fd("Minitalk Client:\n\t./client serverpid message\n", 1), -1);
	if (ft_atoi(argv[1]) == -1)
		return (ft_putstr_fd("Minitalk Client:\n\t./client serverpid message\n", 1), -1);
	signals.sa_sigaction = receiver;
	sigemptyset(&signals.sa_mask);
	signals.sa_flags = SA_SIGINFO;
	sigaction(SIGUSR1, &signals, NULL);
	str_to_bit(argv[2], ft_atoi(argv[1]));
	return (0);
}