#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> // For sleep()

int main(int argc, char *argv[]) {
    // Check if an argument was passed (e.g., ./timer 10)
    if (argc < 2) {
        printf("Usage: %s <minutes>\n", argv[0]);
        return 1;
    }

    // Convert the first command-line argument to an integer
    int sleept = atoi(argv[1]);
    if (sleept <= 0) {
        printf("Invalid duration.\n");
        return 1;
    }

    long total_seconds = 60 * (long)sleept;
    long day = 86400;
    long hor = 3600;

    // Countdown loop
    for (long dombo = 0; dombo <= total_seconds; dombo++) {
        long secd = total_seconds - dombo;

        // ANSI escape sequence to clear screen cleanly without flickering
        printf("\33[2J\33[H");

        // Format: DD:HH:MM:SS
        printf("%02ld:%02ld:%02ld:%02ld\r\n", 
                secd / day, 
                (secd % day) / hor, 
                ((secd % day) % hor) / 60, 
                secd % 60);
        
        fflush(stdout);

        // Sleep for 1 second if the countdown is still running
        if (dombo < total_seconds) {
            sleep(1);
        }
    }

    // Clear the clock screen one last time
    printf("\33[2J\33[H");
    fflush(stdout);
return 0;
}
