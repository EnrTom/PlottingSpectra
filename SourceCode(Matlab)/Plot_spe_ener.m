%QUI SI PLOTTANO GLI SPETTRI A VIDEO DELLE GRANDEZZE TROVATE. IN QUESTO
%FILE C'E' ANCHE LA SELEZIONE DI QUELLO CHE VA PLOTTATO
%INIZIA LA PROCEDURA
%SPETTRO DI ENERGIA....................................................
%Si decide se plottare lo spettro della Norma oppure no
%Prende il grafico e lo azzera
axes(handles.axes3);
cla reset;
%Si decide se si vuole stampare lo spettro della Norma oppure no
if handles.mostraCod == 'On '
    %Se ho selezionato "All" allora plotta tutte le duttilit�
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di energia uno per uno 
            hold on;
            plot(Tr,Er(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limite +-10% (-19 e +21% per l'energia)
            if handles.mostraLim == 'On '
                plot(Tr,1.21*Er(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+10%
                plot(Tr,0.81*Er(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-10%
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di energia solo per la duttilit� fissata
        hold on;
        %Se almeno uno spettro generato/registrato � plottato lo spettro
        %della norma diventa nero
        if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
            plot(Tr,Er(:,mostramu),'-','LineWidth',LT1out,'Color','k')   
        %Se entrambi gli spettri generati e registrati NON sono plottati lo spettro
        %della norma diventa del colore relativo
        elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
            plot(Tr,Er(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
        end
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraLim == 'On '
            %Se NON ho solo lo spettro da Norma l'intervallo � plottato in nero
            %tratteggiato
            if or(handles.mostraGen == 'On ',handles.mostraReg == 'On ')
                plot(Tr,1.21*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore+10%
                plot(Tr,0.81*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color','k') %valore-10%
            %Altrimenti se ho solo lo spettro da Norma anche l'intervallo �
            %colorato del relativo colore della duttilit�
            elseif and(handles.mostraGen == 'Off',handles.mostraReg == 'Off')
                plot(Tr,1.21*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
                plot(Tr,0.81*Er(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
            end
        end
    end
end
%Si decide se plottare lo spettro dei Generati oppure no
if handles.mostraGen == 'On '
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di spostamento uno per uno 
            hold on;
            plot(Tgen,mediaEgen(:,i),'-','LineWidth',LT1out,'Color',Colore(i,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(Tgen,mediaEgen(:,i)+deviaEgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore+dev.st.
                plot(Tgen,mediaEgen(:,i)-deviaEgen(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilit� fissata
        hold on;
        plot(Tgen,mediaEgen(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(Tgen,mediaEgen(:,mostramu)+deviaEgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore+10%
            plot(Tgen,mediaEgen(:,mostramu)-deviaEgen(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu,:)) %valore-10%
        end
        
    end
end

%Si decide se plottare lo spettro dei Registrati oppure no
if handles.mostraReg == 'On '
    if handles.mu == 0
        mostramu = (1:1:max(size(dutti)));
        for i = 1:max(size(mostramu))
            %Plotta tutti gli spettri di spostamento uno per uno 
            hold on;
            plot(Treg,mediaEreg(:,i),'-','LineWidth',LT1out,'Color',Colore(i+1,:))
            %Ora si decide se vanno stampati anche gli intervalli di
            %variazione limie +-10%
            if handles.mostraDev == 'On '
                plot(Treg,mediaEreg(:,i)+deviaEreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore+dev.st.
                plot(Treg,mediaEreg(:,i)-deviaEreg(:,i),'--','LineWidth',LT1out*0.7,'Color',Colore(i+1,:)) %valore-dev.st.
            end
        end
    elseif handles.mu ~= 0
        mostramu = handles.mu;
        %Plotta lo spettro di spostamento solo per la duttilit� fissata
        hold on;
        plot(Treg,mediaEreg(:,mostramu),'-','LineWidth',LT1out,'Color',Colore(mostramu+1,:))
        %Ora si decide se vanno stampati anche gli intervalli di
        %variazione limie +-10%
        if handles.mostraDev == 'On '
            plot(Treg,mediaEreg(:,mostramu)+deviaEreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore+10%
            plot(Treg,mediaEreg(:,mostramu)-deviaEreg(:,mostramu),'--','LineWidth',LT1out*0.7,'Color',Colore(mostramu+1,:)) %valore-10%
        end
        
    end
end

%Decide se visualizzare la griglia o meno sui grafici
if handles.gri == 'On ';
    grid;
    hold on;
end

%Se i limiti non sono stati cambiati prende quelli in defalut
if handles.Tmin >= handles.Tmax
    xlim([0.00  4.00]);
%Altrimenti da i limiti impostati
elseif handles.Tmin < handles.Tmax
    xlim([handles.Tmin  handles.Tmax]);
end
%Cambia il font degli assi
set(handles.axes3,'FontName','Cambria');
xlabel ('T [s]');
ylabel ('PsE [m\cdotg]');










