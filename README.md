# Practical 9: Placement Dashboard using Data Controls

This small ASP.NET Web Forms project demonstrates `GridView`, `DetailsView`, and `DropDownList`. It displays sample campus placement opportunities, counts open and placed records, filters by status, and shows details for the selected company.

## Run in Visual Studio

1. Open `Practical9.sln` in Visual Studio.
2. If Visual Studio asks, install the **ASP.NET and web development** workload and the **.NET Framework 4.8 targeting pack**.
3. In Solution Explorer, right-click `PlacementDashboard` and choose **Set as Startup Project**.
4. Press **Ctrl+F5** (or click **IIS Express**) to run it.
5. Choose a status in the filter, then click **Details** in a row.

The records are sample data held in the browser session, so no database setup is needed. The session data resets when the browser session ends.

Main code: `PlacementDashboard/Default.aspx` (data controls) and `PlacementDashboard/Default.aspx.cs` (sample data, filtering, and binding).
