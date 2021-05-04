function[]= finalProject()

global graph; % make graph, color, and type all global variables
global color;
global type;

x = 0; %initially starts the plot with nothing on it
y = 0;

color='b'; %sets the line to be blue
type='o';
graph.fig = figure('numbertitle', 'off', 'name', 'Graph');
    % makes edit boxes for all of the necessary components
    

    graph.xValues = uicontrol('style','Edit','Units','normalized','Position',[0.1 0.97 0.2 0.03],'backgroundcolor','w','Tag','EditField'); %editboxes for th compenents
    graph.Title  = uicontrol('style','Edit','string','Title','Units','normalized','Position',[0.4 0.95 0.2 0.05],'backgroundcolor','w','Tag','EditField');
    graph.xAxis  = uicontrol('style','Edit','string','X-axis','Units','normalized','Position',[0.4 0.9 0.2 0.03],'backgroundcolor','w','Tag','EditField');
    graph.yAxis  = uicontrol('style','Edit','string','Y-axis','Units','normalized','Position',[0.4 0.87 0.2 0.03],'backgroundcolor','w','Tag','EditField');
    graph.yValues = uicontrol('style','Edit','Units','normalized','Position',[0.1 0.94 0.2 0.03],'backgroundcolor','w','Tag','EditField');

    graph.x = uicontrol('style', 'text', 'units', 'normalized', 'position', [.01 .95 .08 .05], 'string', 'x-values:', 'horizontalalignment', 'right'); %creates the spaces for the controls
    graph.y = uicontrol('style', 'text', 'units', 'normalized', 'position', [.01 .92 .08 .05], 'string', 'y-values:', 'horizontalalignment', 'right');
    graph.xup = uicontrol('style', 'text', 'units', 'normalized', 'position', [.01 .875 .08 .05], 'string', 'Upper X Limit:', 'horizontalalignment', 'right');
    graph.xlow = uicontrol('style', 'text', 'units', 'normalized', 'position', [.01 .845 .08 .05], 'string', 'Lower X Limit:', 'horizontalalignment', 'right');
    graph.yup = uicontrol('style', 'text', 'units', 'normalized', 'position', [.01 .805 .08 .05], 'string', 'Upper Y Limit:', 'horizontalalignment', 'right');
    graph.ylow = uicontrol('style', 'text', 'units', 'normalized', 'position', [.01 .775 .08 .05], 'string', 'Lower Y Limit:', 'horizontalalignment', 'right');
    graph.titleLabel = uicontrol('style', 'text', 'units', 'normalized', 'position', [.32 .93 .08 .05], 'string', 'Title:', 'horizontalalignment', 'right'); %sets the postioning for all of the components
    graph.xAxisLabel = uicontrol('style', 'text', 'units', 'normalized', 'position', [.32 .875 .08 .05], 'string', 'X-Axis:', 'horizontalalignment', 'right');
    graph.yAxisLabel = uicontrol('style', 'text', 'units', 'normalized', 'position', [.32 .845 .08 .05], 'string', 'Y-Axis:', 'horizontalalignment', 'right');

    graph.xUpLim = uicontrol('style','Edit','Units','normalized','Position',[0.1 0.9 0.2 0.03],'backgroundcolor','w','Tag','EditField'); %sets the upper and lower limits for the graph and its numbers
    graph.xLowLim = uicontrol('style','Edit','Units','normalized','Position',[0.1 0.87 0.2 0.03],'backgroundcolor','w','Tag','EditField');
    graph.yUpLim = uicontrol('style','Edit','Units','normalized','Position',[0.1 0.83 0.2 0.03],'backgroundcolor','w','Tag','EditField');
    graph.yLowLim = uicontrol('style','Edit','Units','normalized','Position',[0.1 0.8 0.2 0.03],'backgroundcolor','w','Tag','EditField');

    

    graph.buttonGroup=uibuttongroup('units','normalized','Position', [0.02 0.2 0.25 0.3], 'selectionChangedfcn',{@changeColor});
    graph.blue = uicontrol(graph.buttonGroup, 'Style','radiobutton','String','Blue','units','normalized','Position', [0.05 0.84 0.05 0.05], 'horizontalalignment', 'right');
    graph.red = uicontrol(graph.buttonGroup, 'Style','radiobutton','String','Red','units','normalized','Position', [0.05 0.9 0.05 0.05], 'horizontalalignment', 'right');
    graph.green = uicontrol(graph.buttonGroup, 'Style','radiobutton','String','Green','units','normalized','Position', [0.05 0.78 0.05 0.05], 'horizontalalignment', 'right');
    graph.yellow = uicontrol(graph.buttonGroup, 'Style','radiobutton','String','Yellow','units','normalized','Position', [0.05 0.72 0.05 0.05], 'horizontalalignment', 'right'); %Makes a button group for the styles of the graph, and calls for the changeStyle function

    

    graph.typeGroup=uibuttongroup('units','normalized','Position', [0.02 0.1 0.25 0.3], 'selectionChangedfcn',{@changeType});
    graph.circle = uicontrol(graph.typeGroup, 'Style','radiobutton','String','Circle','units','normalized','Position', [0.05 0.84 0.05 0.05], 'horizontalalignment', 'right');
    graph.dash = uicontrol(graph.typeGroup, 'Style','radiobutton','String','Dash','units','normalized','Position', [0.05 0.9 0.05 0.05], 'horizontalalignment', 'right');
    graph.dotted = uicontrol(graph.typeGroup, 'Style','radiobutton','String','Dotted','units','normalized','Position', [0.05 0.78 0.05 0.05], 'horizontalalignment', 'right');
    graph.solid = uicontrol(graph.typeGroup, 'Style','radiobutton','String','Solid','units','normalized','Position', [0.05 0.72 0.05 0.05], 'horizontalalignment', 'right');

    %Assigns positions for the buttons that control the color

    graph.redButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .47 .03 .02], 'string', 'Red', 'horizontalalignment', 'right');
    graph.blueButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .45 .03 .02], 'string', 'Blue', 'horizontalalignment', 'right');
    graph.greenButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .43 .03 .02], 'string', 'Green', 'horizontalalignment', 'right');
    graph.yellowButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .41 .03 .02], 'string', 'Yellow', 'horizontalalignment', 'right');

    %Positions a line saying to customize the graph

    graph.Choose = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .53 .15 .02], 'string', 'Customize Your Plot Below!', 'horizontalalignment', 'right');

    %Assigns positions to the line type buttons

    graph.dottedButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .31 .03 .02], 'string', 'Solid', 'horizontalalignment', 'right');
    graph.dashedButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .37 .035 .02], 'string', 'Dashed', 'horizontalalignment', 'right');
    graph.circleButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .35 .03 .02], 'string', 'Circles', 'horizontalalignment', 'right');
    graph.solidButton = uicontrol('style', 'text', 'units', 'normalized', 'position', [.05 .33 .03 .02], 'string', 'Dotted', 'horizontalalignment', 'right');
 
    %Makes and positions buttons that call for the Plot and Clear functions

    graph.Plot = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.034 .007 .14 .05], 'string', 'Plot', 'callback', {@Plot,x,y});
    graph.Clear = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[.2 .007 .14 .05], 'string', 'Clear', 'callback', {@Clear});
    set(gcf,'position',[40,15,1200,625])%sets graph
    set(graph.xValues,'Max',2);%  these lines set the graph to a more manageable size
    set(graph.yValues,'Max',2);
    graph.ActualPlot=plot(x,y);
    graph.ActualPlot.Parent.Position = [.35,.2,.6,.6];

function[]= Plot(source, event, x, y)

    x = str2num(graph.xValues.String); %assigns x and y to the input value
    y = str2num(graph.yValues.String);
    if length(x) == length(y) %checks if the lengths of the inputs is equal
    plot(x,y,[color type]) %plots the input points, along with the color and type of dot as assigned below
    title(graph.Title.String) %positions the title, x label, and y label
    xlabel(graph.xAxis.String)
    ylabel(graph.yAxis.String)

        a = str2num(graph.xLowLim.String);%assigns a,b,c, and d to limits for the graph
        b = str2num(graph.xUpLim.String);
        c = str2num(graph.yLowLim.String);
        d = str2num(graph.yUpLim.String);

    else
       
        msgbox('X and Y are not of equal length!', 'Graph Error', 'error', 'modal'); %shows error message if code does not work

        return  

    end

     if isempty(a) || isempty(b) || isempty(c) || isempty(d) %checks if any of the limits have been left empty

           xlim(['auto']) %if limits are left empty, sets the limits to automatic to avoid error and plot graph
           ylim(['auto'])

     else

            if b>a && d>c %confirms that the upper lims are larger than the lower limits

            xlim([a b])
            ylim([c d])

        else

            msgbox('Please Check The Limits!', 'Graph Error', 'error', 'modal'); 
            xlim(['auto']) %sets the limits to automatic if lower is larger than upper
            ylim(['auto'])

            end
     end
end

    function[]= changeType(source, event) 

    if (strcmp('Circle', event.NewValue.String)) %sets points to 'o' if Circle is selected

         type = 'o';

     elseif (strcmp('Dash', event.NewValue.String)) %sets points to dashes if Dash is selected

         type = '--';

     elseif (strcmp('Solid', event.NewValue.String)) %sets to solid if solid is selected

         type = '-';

     else

         type = ':'; %if nothis else, sets to dotted

    end

    end

    function[]=changeColor(source, event) %function that changes the color of the line or points

    if (strcmp('Red', event.NewValue.String)) %changes color to red

        color = 'r';

    elseif (strcmp('Blue', event.NewValue.String))%changes color to blue

        color = 'b';

    elseif (strcmp('Yellow', event.NewValue.String)) %changes color to yellow

        color = 'y';

    else

        color = 'g'; %changes color to green

    end

    end

function []= Clear(source, event, x, y)%this is the function that clears all of the values when clear is hit

     x=0;
     y=0;
     plot(x,y);
     graph.xValues.String=' '; %sets the x any y values in edit box to 0
     graph.yValues.String=' ';
     graph.xaxis.String= 'X-axis'; %sets the x any y axes to the default setting
     graph.yaxis.String= 'Y-axis';
     graph.xLowLim.String = ' ';
     graph.xUpLim.String = ' ';
     graph.yLowLim.String = ' '; %sets all other text boxes to a blank box
     graph.yUpLim.String = ' ';
     graph.Title.String = 'Title';
     graph.xAxis.String = 'X-axis';
     graph.yAxis.String = 'Y-axis';

end
end
