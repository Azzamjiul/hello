# Use the official Windows Server Core image with IIS
FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

# Install .NET Framework
RUN powershell -Command \
    Install-WindowsFeature Web-Server; \
    Install-WindowsFeature Web-Asp-Net45

# Set the working directory
WORKDIR /inetpub/wwwroot

# Copy the build files from the React app (make sure to build it!)
COPY build/ .

# Expose port 80
EXPOSE 80

# Start IIS
CMD ["C:\\ServiceMonitor.exe", "w3svc"]