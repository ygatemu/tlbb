--�����
--ǿ��

--2006-9-18 17:05 (����ļ����ڵ�������Ϊ�˼��ݡ�����չ�������������жϣ�����ecity_lifeskillstudy.lua��ʵ��)
x713624_g_ScriptId 		= 713624
x713624_g_AbilityName	= "ǿ��"
x713624_g_AbilityID		= ABILITY_QIANGSHEN

-- �������������ѡ��
function x713624_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	if bid then
		if 0 == nNum then	--ѧϰ
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713624_g_AbilityID, bid, 4)
			local studyMsg = format("�����ﵽ%d�����ҿϻ���#{_EXCHG%d}��%d��ﹱ�Ϳ���ѧ��ǿ�����ܡ������ѧϰô��", lv, money, con)
			AddText(sceneId,studyMsg)
			--ȷ��ѧϰ��ť
					AddNumText(sceneId,x713624_g_ScriptId,"��ȷ��Ҫѧϰ", 6, 3)
			--ȡ��ѧϰ��ť
					AddNumText(sceneId,x713624_g_ScriptId,"��ֻ��������", 8, 4)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 1 == nNum then	--����
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713624_g_AbilityID, bid, 2)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713624_g_AbilityID, bid, 2)
			end
		elseif 2 == nNum then	--�˽�
			local dialog = "#{event_liveabilityevent_0033}"
			BeginEvent(sceneId)
				AddText(sceneId, dialog)
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
		elseif 3 == nNum then	--ȷ��ѧϰ
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713624_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713624_g_AbilityID, bid, 1)
			end
		elseif 4 <= nNum then	--ֻ������
			CallScriptFunction( npcScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	else
		-- Ŀǰǿ�����ܱ����ڳ��������ѧϰ���������˽�
	end
end

-- �о�ѡ��
-- nNum == 1 ѧϰ
-- nNum == 2 ����
-- nNum == 3 �˽�
function x713624_OnEnumerate( sceneId, selfId, targetId, bid, nNum)
	if bid then
		if 1 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713624_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713624_g_ScriptId,"ѧϰ"..x713624_g_AbilityName.."����", 12, 0) end
			return
		elseif 2 == nNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713624_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713624_g_ScriptId,"����"..x713624_g_AbilityName.."����", 12, 1) end
			return
		elseif 3 == nNum then
			AddNumText(sceneId,x713624_g_ScriptId,"�����˽�ǿ��",11,2)
			AddNumText(sceneId,x713624_g_ScriptId,"����",8,5)
		end
	else
		-- Ŀǰǿ�����ܱ����ڳ��������ѧϰ���������˽�
	end
end