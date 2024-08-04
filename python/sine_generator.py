import numpy as np # type: ignore
import matplotlib.pyplot as plt # type: ignore
from numpy import sin,pi # type: ignore



def generate_sine(amp,freq):

# Generate the sine wave
    sine_wave = amp * np.sin(2 * np.pi * freq * time)+7500
    return(sine_wave)



def plot_wave(sine_wave,time):
    plt.figure(figsize=(10, 4))
    plt.plot(time, sine_wave)
    plt.title('Sine Wave')
    plt.xlabel('Time (s)')
    plt.ylabel('Amplitude')
    plt.grid(True)
    plt.show()



def samples_txt(sine_wave,filename):
      with open(filename, 'w') as file:
           for i, val in enumerate(sine_wave):
                if i % 20 == 0 and i != 0:
                   file.write('\n')  # Start a new line every 20 values, except for the first line
                file.write(f'{int(val)},')


num_samples=500
time = np.linspace(0, 1, num_samples)


sine_wave_30=generate_sine(7500,30)
sine_wave_2=generate_sine(7500,2)

noisy=(sine_wave_30+sine_wave_2)/2
plot_wave(sine_wave_30,time)


samples_txt(sine_wave_2,"sine_2.txt")
samples_txt(sine_wave_30,"sine_30.txt")
samples_txt(noisy,"noisy.txt")
